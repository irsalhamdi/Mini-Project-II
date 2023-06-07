package main

import (
	"crm/entity"
	"crm/modules/actor"
	"crm/modules/customer"
	db2 "crm/utils/db"
	"fmt"
	"os"
	"time"

	ratelimit "github.com/JGLTechnologies/gin-rate-limit"
	helmet "github.com/danielkov/gin-helmet"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {

	_ = godotenv.Load()
	db := db2.GormMysql()
	router := gin.New()
	router.Use(cors.Default())
	router.Use(helmet.Default())
	store := ratelimit.InMemoryStore(&ratelimit.InMemoryOptions{
		Rate:  time.Minute * 1,
		Limit: 20,
	})
	mw := ratelimit.RateLimiter(store, &ratelimit.Options{
		ErrorHandler: entity.ErrorHandler,
		KeyFunc:      entity.KeyFunc,
	})
	router.Use(mw)
	actorHandler := actor.NewRouter(db)
	actorHandler.Handle(router)

	customerHandler := customer.NewRouter(db)
	customerHandler.Handle(router)

	errRouter := router.Run(os.Getenv("PORT"))
	if errRouter != nil {
		fmt.Println("error running server", errRouter)
		return
	}
}
