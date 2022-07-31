package main

import "time"

// This is an example of race condition
// 2 goroutines tries to read&write sharedInt and there is no access control.

var sharedInt int = 0
var unusedValue int = 0

func runSimpleReader() {
	for {
		var val int = sharedInt
		if val%10 == 0 {
			unusedValue = unusedValue + 1
		}
	}
}

func runSimpleWriter() {
	for {
		sharedInt = sharedInt + 1
	}
}

func startSimpleReadWrite() {
	go runSimpleReader()
	go runSimpleWriter()
	time.Sleep(10 * time.Second)
}

// func main() {
// 	startSimpleReadWrite()
// }
