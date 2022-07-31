package main

import "time"

// This is an example of race condition
// 2 goroutines tries to read&write sharedMap and there is no access control.
// This code should raise a panic condition

var sharedMap map[string]int = map[string]int{}

func runSimpleMapReader() {
	for {
		var _ int = sharedMap["key"]
	}
}

func runSimpleMapWriter() {
	for {
		sharedMap["key"] = sharedMap["key"] + 1
	}
}

func startMapReadWrite() {
	sharedMap["key"] = 0

	go runSimpleMapReader()
	go runSimpleMapWriter()
	time.Sleep(10 * time.Second)
}

// func main() {
// 	startMapReadWrite()
// }
