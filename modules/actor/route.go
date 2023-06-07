package actor

import (
	"crm/middleware"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type RouterActorStruct struct {
	actorRequestHandler RequestHandlerActorStruct
}

func NewRouter(
	dbCrud *gorm.DB,
) RouterActorStruct {
	return RouterActorStruct{
		actorRequestHandler: RequestHandler(
			dbCrud,
		),
	}
}

func (r RouterActorStruct) Handle(router *gin.Engine) {
	basepath := "api/v1/actor"

	actorRouter := router.Group(basepath, middleware.Auth)

	actorRouter.POST("/register",
		r.actorRequestHandler.CreateActor,
	)

	actorRouter.GET("/:id",
		r.actorRequestHandler.GetActorById,
	)
	actorRouter.GET("",
		r.actorRequestHandler.GetAllActor,
	)

	actorRouter.PUT("/:id",
		r.actorRequestHandler.UpdateActorById,
	)
	actorRouter.DELETE("/:id",
		r.actorRequestHandler.DeleteActorById,
	)
	actorRouter.GET("/:id/activate",
		r.actorRequestHandler.ActivateActorById)

	actorRouter.GET("/:id/deactivate",
		r.actorRequestHandler.DeactivateActorById)

	router.POST("api/v1/actor/login",
		r.actorRequestHandler.LoginActor)

	router.GET("api/v1/actor/logout",
		r.actorRequestHandler.LogoutActor)
}
