package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", helloWorld)
	log.Fatal(http.ListenAndServe(":10000", nil))
}

func helloWorld(r http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(r, "Hello Docker !")
	return
}
