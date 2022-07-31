package main

import (
	"context"
	"fmt"
	"sync"
	"time"
)

var shareMapForMutex map[string]int = map[string]int{}
var mapMutex = sync.Mutex{}
var mutexReadCount int16 = 0

func runMapMutexReader(ctx context.Context, readChan chan int) {
	readCount := 0
	for {
		select {
		case <- ctx.Done():
			fmt.Println("reader extiing...")
			readChan <- readCount
			return
		default:
			mapMutex.Lock()
			var _ int = shareMapForMutex["key"]
			mapMutex.Unlock()
			readCount += 1
		}
	}
}

func runMapMutexWriter(ctx context.Context) {
	for {
		select {
		case <-ctx.Done():
			fmt.Println("writer exiting...")
			return
		default:
			mapMutex.Lock()
			shareMapForMutex["key"] = shareMapForMutex["key"] + 1
			mapMutex.Unlock()
			time.Sleep(100 * time.Microsecond)
		}
	}
}

func startMapMutexReadWrite() {
	testContext, cancel := context.WithCancel(context.Background())

	readCh := make(chan int)
	shareMapForMutex["key"] = 0

	numberOfReaders := 15

	for i := 0; i < numberOfReaders; i++ {
		go runMapMutexReader(testContext, readCh)
	}
	go runMapMutexWriter(testContext)

	time.Sleep(2 * time.Second)

	cancel()

	totalReadCount := 0

	for i := 0; i < numberOfReaders; i++ {
		totalReadCount += <-readCh
	}

	time.Sleep(1 * time.Second)

	var counter int = shareMapForMutex["key"]

	fmt.Printf("[MUTEX] Write Counter value: %v\n", counter)
	fmt.Printf("[MUTEX] Read Counter value: %v\n", totalReadCount)
}

func main() {
	startMapMutexReadWrite()
}
