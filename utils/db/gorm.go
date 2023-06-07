package db

import (
	"log"
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func GormMysql() *gorm.DB {
	var db, err = gorm.Open(mysql.Open(os.Getenv("DATABASE_URI")), &gorm.Config{Logger: logger.Default.LogMode(logger.Info)})
	db = db.Debug()
	if err != nil {
		log.Println("gorm.open", err)
	}
	return db

}
