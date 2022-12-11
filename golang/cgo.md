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



