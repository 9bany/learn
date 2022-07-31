package main

import (
	"context"
	"fmt"
	"sync"
	"time"
)

var sharedMapForRWMutex map[string]int = map[string]int{}
var mapRWMutex = sync.RWMutex{}
var rwMutexReadCount int64 = 0

func runMapRWMutexReader(ctx context.Context, readChan chan int) {
	readCount := 0
	for {
		select {
		case <-ctx.Done():
			fmt.Println("reader exiting...")
			readChan <- readCount
			return
		default:
			mapRWMutex.RLock()
			var _ int = sharedMapForRWMutex["key"]
			mapRWMutex.RUnlock()
			readCount += 1
		}
	}
}

func runMapRWMutexWriter(ctx context.Context) {
	for {
		select {
		case <-ctx.Done():
			fmt.Println("writer exiting...")
			return
		default:
			mapRWMutex.Lock()
			sharedMapForRWMutex["key"] = sharedMapForRWMutex["key"] + 1
			mapRWMutex.Unlock()
			time.Sleep(100 * time.Millisecond)
		}
	}
}

func startMapRWMutexReadWrite() {
	testContext, cancel := context.WithCancel(context.Background())

	readCh := make(chan int)
	sharedMapForRWMutex["key"] = 0

	numberOfReaders := 15
	for i := 0; i < numberOfReaders; i++ {
		go runMapRWMutexReader(testContext, readCh)
	}
	go runMapRWMutexWriter(testContext)

	time.Sleep(2 * time.Second)

	cancel()

	totalReadCount := 0
	for i := 0; i < numberOfReaders; i++ {
		totalReadCount += <-readCh
	}

	time.Sleep(1 * time.Second)

	var counter int = sharedMapForRWMutex["key"]
	fmt.Printf("[RW MUTEX] Write Counter value: %v\n", counter)
	fmt.Printf("[RW MUTEX] Read Counter value: %v\n", totalReadCount)
}
