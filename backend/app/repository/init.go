package repository

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/go-sql-driver/mysql"
)

var Db *sql.DB

func init() {
	var err error

	drivername := "mysql"
	dsn := fmt.Sprintf("%s:%s@(db:3306)/%s?charset=utf8", os.Getenv("MYSQL_USER"), os.Getenv("MYSQL_PASSWORD"), os.Getenv("MYSQL_DATABASE"))

	Db, err = sql.Open(drivername, dsn)

	if err != nil && err.Error() != "" {
		log.Fatal(err.Error())
	}

	err = Db.Ping()

	if err != nil && err.Error() != "" {
		log.Fatal(err.Error())
	}

	fmt.Println("Connection has been established!")
}
