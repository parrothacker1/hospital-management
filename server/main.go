package main

import (
	"database/sql"
	doc "hospital/doctor"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

func main() {
	coninfo := "user=postgres dbname=test password=root host=127.0.0.1 sslmode=disable"
	db, err := sql.Open("postgres", coninfo)
	if err == nil {
		server := gin.Default()
		doc.Db = db
		db.Query("CREATE TABLE IF NOT EXISTS doctor(name VARCHAR,age INT)")
		doctor := server.Group("/doctor")
		{
			doctor.GET("", doc.List)
			doctor.POST("/:name/:age", doc.Add)
			doctor.PUT("/:old_name/:new_name/:age", doc.Update)
			doctor.DELETE("/:name", doc.Delete)
		}
		server.Run()
	} else {
		panic(err)
	}
	defer db.Close()
}
