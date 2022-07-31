package main

import (
	"sync/atomic"
	"time"
)

var sharedIntForAtomic int64 = 0
var unusedValueForAtomic int = 0

func runAtomicReader() {
	for {
		var val int64 = atomic.LoadInt64(&sharedIntForAtomic)
		if val%10 == 0 {
			unusedValueForAtomic = unusedValueForAtomic + 1
		}
	}
}

func runAtomicWriter() {
	for {
		atomic.AddInt64(&sharedIntForAtomic, 1)
	}
}

func startAtomicReadWrite() {
	go runAtomicReader()
	go runAtomicWriter()
	time.Sleep(10 * time.Second)
}

// func main() {
// 	startAtomicReadWrite()
// }
