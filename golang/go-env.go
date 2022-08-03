package main

import (
	"fmt"
	"os"
)

func main() {

	fmt.Println("FOO:", os.Getenv("FOO"))
	fmt.Println("BAR:", os.Getenv("BAR"))

}
