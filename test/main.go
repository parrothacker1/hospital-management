package main

import (
	"fmt"
//	_ "github.com/jackc/pgx"
	_ "github.com/lib/pq"
	"database/sql"
)

type Doc struct {
	Name string `feild:"name"`
	Age int`'feild:"age"`
}

var docs []Doc

func main() {
	con := "user=postgres dbname=test password=root host=127.0.0.1 sslmode=disable"
	db,err := sql.Open("postgres",con)
	if err != nil {
		panic(err.Error())
	}
	defer db.Close()
//	fmt.Println("connection sucss")
	rows,err2 := db.Query("SELECT * FROM doctor")
	if err2 != nil {
		panic(err2.Error())
	}
	defer rows.Close()
//	fmt.Println("Git rows")

	for rows.Next() {
		var d Doc
		if err := rows.Scan(&d.Name,&d.Age); err != nil {
			panic(err.Error)
		}
		docs = append(docs,d)
	}
	fmt.Println(docs)
}
