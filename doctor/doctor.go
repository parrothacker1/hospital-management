package doctor

import (
	"database/sql"
	"fmt"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

var Db *sql.DB

type Doctor struct {
	Name string `uri:"name" binding:"required" feild:"name"`
	Age  int `uri:"age" binding:"required" feild:"age"`
}

func List(c *gin.Context) {
	var docs []Doctor
	rows,_ := Db.Query("SELECT * FROM doctor")
	defer rows.Close()
	for rows.Next() {
		var doc Doctor
		if err := rows.Scan(&doc.Name,&doc.Age); err != nil {
			fmt.Println(err)
		 }
		docs = append(docs,doc)
	}
	c.JSON(200, gin.H{
		"message":docs,
	})
}

func Add(c *gin.Context) {
	var msg string
	var doc Doctor
	if err := c.ShouldBindUri(&doc); err == nil {
		fmt.Println(doc)
		_, err := Db.Query("INSERT INTO doctor(name,age) VALUES ($1,$2)", doc.Name, doc.Age)
		if err != nil {
			msg = fmt.Sprintf("failed %s",err.Error())
		} else {
			msg = "success"
		}
		c.JSON(200, gin.H{
			"message": msg,
		})
	} else {
		c.JSON(301, gin.H{
			"message": "error_in_parsing",
		})
	}
}

func Update(c *gin.Context) {
	type Update struct {
		Old_name string `uri:"old_name" binding:"required"`
		New_name string `uri:"new_name" binding:"required"`
		Age      int `uri:"age" binding:"required"`
	}
	var msg string
	var update Update
	if err := c.ShouldBindUri(&update); err == nil {
		_, err = Db.Query("UPDATE doctor SET name=$2,age=$3 WHERE name=$1", update.Old_name, update.New_name, update.Age)
		if err == nil {
			msg="success"
		} else {
			msg= fmt.Sprintf("failed %s",err.Error())
		}
		c.JSON(200,gin.H{
			"message":msg,
		})
	} else {
		c.JSON(301,gin.H{
			"message":"error_in_parsing",
		})
	}
}

func Delete(c *gin.Context) {
	var msg string
	var doc Doctor
	if err := c.ShouldBindUri(&doc); err == nil {
		_, err = Db.Query("DELETE FROM doctor WHERE name=$1", doc.Name)
		if err == nil {
			msg = "success"
		} else {
			msg = fmt.Sprintf("failed %s",err.Error())
		}
		c.JSON(200, gin.H{
			"message": msg,
		})
	} else {
		c.JSON(301, gin.H{
			"message": "error_in_parsing",
		})
	}
}
