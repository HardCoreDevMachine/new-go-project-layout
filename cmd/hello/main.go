package main

import (
	"flag"
	"fmt"
)

func main() {
	name := flag.String("name", "", "name to greet")
	flag.Parse()

	if *name == "" {
		fmt.Println("Привет, мир!")
		return
	}

	fmt.Printf("Привет, %s!\n", *name)
}
