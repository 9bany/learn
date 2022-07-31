package main

import (
	"fmt"
	"log"
)

func main() {
	divByZero()
	fmt.Println("Although panicked. We recovered. We call mul() func")
	fmt.Println("mul func result: ", mul(5, 10))
}

func div(x, y int) int {
	return x / y
}

func mul(x, y int) int {
	return x * y
}

func divByZero() {
	defer func() {
		if err := recover(); err != nil {
			log.Println("panic occurred:", err)
		}
	}()
	fmt.Println(div(1, 0))
}
