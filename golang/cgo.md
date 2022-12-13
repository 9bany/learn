# cgo

Enables the creation of G packages that call C codes.

- ref: https://pkg.go.dev/cmd/cgo
- code example: https://github.com/9bany/cgo-example
- source code: https://github.com/golang/go/tree/master/misc/cgo

## The basic

### 1. Introduce
- If you `import "C"` that using `cgo`
- The Go file have access to anything appearing in the comment `immediately preceding` the line `import "C"`, will linked against to cgo comments in other Go files, and all C files included in the build process.

### 2. Let's Explain.

You have structure tree like

```
go_example
    foo.go
    bar.go
    main.go 
```

```go
// foo.go file
package main

/*
#include <stdio.h>
#include <stdlib.h>

void sprintFoo(char* c) {
	printf("foo: %s\n", c);
}
*/
import "C"

import "unsafe"

func PrintFoo() {
	foo := C.CString("Hello ! I'm Foo")
	C.sprintFoo(foo)
	// release foo variable
	C.free(unsafe.Pointer(foo))
}

```

```go
// bar.go file
package main

/*
#include <stdio.h>
#include <stdlib.h>

void sprintFoo(char* c) {
	printf("foo: %s\n", c);
}
*/
import "C"

import "unsafe"

func PrintFoo() {
	foo := C.CString("Hello ! I'm Foo")
	C.sprintFoo(foo)
	// release foo variable
	C.free(unsafe.Pointer(foo))
}

```

```go
// main.go file

package main

func main() {
	PrintFoo()
	PrintBar()
}

```

```
// output
foo: Hello ! I'm Foo
bar: Hello ! I'm Bar
```

- Go will access the comments `immediately preceding` the line `import "C"` in the `foo.go` and `bar.go` files and linking against there comments and `stdio.h`, `stdlib.h` files in the build process.

- source code ref: https://github.com/9bany/cgo-example/tree/master/go_multiple


## Calling Go functions from C 

### Global functions

```go 
// main.go file
package main

import "fmt"

/*
#include <stdio.h>
extern void FooC();
*/

import "C"

// export
func FooGo() {
	fmt.Println("This is foo")
}

func Example() {
	C.FooC()
}

func main() {
	Example()
}

```

```c
// foo.c file
#include "_cgo_export.h"
void FooC() {
	sprintf("this is C foo\n");
	FooGo();
}
```
## Function variables

Go can't pass a function value directly to C

This example uses a registry with a mutex 

```go
package main
import (
	"fmt"
	"mutex"
)

/*
extern void go_call_back(int foo, int p);

static inline void CallMyFunc(int foo) {
	go_call_back(foo, 5);
}
*/
import "C"

//export go_call_back
func go_call_back(foo C.int, p C.int) {
	fn := lookup(int(foo))
	fn(p)
}

func MyCallback(x C.int) {
	fmt.Println("callback with", x)
}

func Example() {
	i := register(MyCallback)
	C.CallMyFunction(C.int(i))
	unregister(i)
}

///////////////////////////
var mu sync.Mutex
var index int
var fns = make(map[int]func(C.int))

func register(fn func(C.int)) int {
	mu.Lock()
	defer mu.Unlock()
	index++
	for fns[index] != nil {
		index++
	}
	fns[index] = fn
	return index
}

func lookup(i int) func(C.int) {
	mu.Lock()
	defer mu.Unlock()
	return fns[i]
}

func unregister(i int) {
	mu.Lock()
	defer mu.Unlock()
	delete(fns, i)
}
////////////////////////
```

Using cgo.Hanle
- ref: https://pkg.go.dev/runtime/cgo@go1.17#Handle
```go
package main

import (
	"fmt"
	"runtime/cgo"
)

/*
#include <stdint.h>

extern void go_callback_int(uintptr_t h, int p1);
static inline void CallMyFunction(uintptr_t h) {
	go_callback_int(h, 5);
}
*/
import "C"

//export go_callback_int
func go_callback_int(h C.uintptr_t, p1 C.int) {
	fn := cgo.Handle(h).Value().(func(C.int))
	fn(p1)
}

func MyCallback(x C.int) {
	fmt.Println("callback with", x)
}

func main() {
	h := cgo.NewHandle(MyCallback)
	C.CallMyFunction(C.uintptr_t(h))
	h.Delete()
}
```

