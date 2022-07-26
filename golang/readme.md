# Golang 

## Contents
- [Variables, Values & Type](#variables-values--type)
    - [Variables](#variables)
    - [Values](#values)
    - [Type](#type)
- [Programing fundamentals]
- [Control flow]
- [Grouping data] 
- [Structs ]
- [Functions]
- [Pointers ]
- [Application (json, sort)]
- [Concurrency] 
- [Channels]
- [Error handling]
- [Writing ducomentation]
- [Testing and benchmarking]

## Variables, Values & Type
### Variables
var declares 1 or more variables.
```go
    var a = "initial"
    fmt.Println(a)
```
You can declare multiple variables at once.
```go
    var b, c int = 1, 2
    fmt.Println(b, c)
```
Go will infer the type of initialized variables.
```go
    var d = true
    fmt.Println(d)
```
Variables declared without a corresponding initialization are zero-valued. For example, the zero value for an int is 0.
```go
    var e int
    fmt.Println(e)
```
The := syntax is shorthand for declaring and initializing a variable, e.g. for var f string = "apple" in this case.
```go
    f := "apple"
    fmt.Println(f)
```

## Values 
	
Strings, which can be added together with +.
```go
    fmt.Println("go" + "lang")
```
Integers and floats.
```go
    fmt.Println("1+1 =", 1+1)
    fmt.Println("7.0/3.0 =", 7.0/3.0)
```
Booleans, with boolean operators as you’d expect.
```go
    fmt.Println(true && false)
    fmt.Println(true || false)
    fmt.Println(!true)
```
### Type

| type   |      byte      |  range |
|----------|:-------------:|------:|
| `bool` |   |  |
| `string` |      |    |
| `int8` | 8-bit |    -128 to 127 |
| `int16` | 16-bit |    -32768 to 32767 |
| `int` & `int32` | 32-bit |    -2147483648 to 2147483647 |
| `int64` | 64-bit |    -9223372036854775808 to 9223372036854775807 |
| `byte` & `uint8` | 8-bit |    0 to 255 |
| `uint16` | 16-bit |    0 to 65535 |
| `uint32` | 32-bit |    0 to 4294967295 |
| `uint64` | 64-bit |    0 to 18446744073709551615 |
|  `float32`  | 32-bit |1.401298464324817070923729583289916131280e-45 to 3.40282346638528859811704183484516925440e+38. | 
|  `float64`  | 64-bit |  4.940656458412465441765687928682213723651e-324 to 1.797693134862315708145274237317043567981e+308.  |
| `complex64` | 32-bit | like float32 |
| `complex128` | 64-bit | like float64|
| `rune` | 
| `uintptr` | 

#### 1. int and uint

- Not only can int handle negative values, unlike `uint`, but did you know that byte is actually an alias for the `uint8` type? That’s right, define a byte and check out the type and you will find the type is `uint8` under the hood.

- This brings up a good point: uint’s are used for memory as memory is always a non-negative number (how many `bits/bytes`). So, when you index a string, you will actually get back a byte or `uint8` value. Try it out! You have to explicitly range or convert the string first in order to get a `rune` when indexing (`rune` itself is an alias for `int32`).

- You OFTEN work with bytes in order to transmit data, read/write files, etc. So, it’s definitely worth knowing that a byte is really a `uint8`. The `uint8` is also the smallest unit of the `UTF-8` encoding scheme, which is used for all Go code files. The uint types (`uint8`, `uint16`, `uint32`, & `uint64`) are actually the best types to use for counting and anything else that can never be negative. They produce an overflow error if you try to assign a negative value to them, just like when trying to assign a value over `255` to a `byte/uint8` or any other numeric value above the max for that type.

#### 2. float32 and float64

- Using math.Float32bits and math.Float64bits, you can see how Go represents the different decimal values as a IEEE 754 binary value:

#### 3. Complex
- The default type for a complex number in golang is complex128. You can create a complex number like this 
```go
var x = 5 + 7i  // Type inferred as `complex128`

```

Go also provides a built-in function named complex for creating complex numbers. If you’re creating a complex number with variables instead of literals, then you’ll need to use the complex function
```go
var a = 3.57
var b = 6.23

// var c = a + bi won't work. Create the complex number like this -
var c = complex(a, b)
```

Note that, both real and imaginary parts of the complex number must be of the same floating point type. If you try to create a complex number with different real and imaginary part types, then the compiler will throw an error 

```go
var a float32 = 4.92
var b float64 = 7.38

/*
   The Following statement Won't compile. 
   (Both real and imaginary parts must be of the same floating-point type)
*/
var c = complex(a, b)  // Compiler Error
```

#### 4. operations on complex numbers
You can perform arithmetic operations like addition, subtraction, multiplication, and division on complex numbers
```go
package main
import "fmt"

func main() {
	var a = 3 + 5i
	var b = 2 + 4i

	var res1 = a + b
	var res2 = a - b
	var res3 = a * b
	var res4 = a / b

	fmt.Println(res1, res2, res3, res4)
}
```

```
# Output
(5+9i) (1+1i) (-14+22i) (1.3-0.1i)
```
#### 5. uintptr

uintptr is there to bypass the type system and allow the Go implementors to write Go runtime libraries, including the garbage collection system, in Go, and to call C-callable code including system calls using C pointers that are not handled by Go at all.

If you're acting as an implementor—e.g., providing access to system calls on a new OS—you'll need uintptr. You will also need to know all the special magic required to use it, such as locking your goroutine to an OS-level thread if the OS is going to do stack-ish things to OS-level threads, for instance. (If you're using it with Go pointers, you may also need to tell the compiler not to move your goroutine stack, which is done with special compile-time directives.)

The runtime system considers an unsafe.Pointer as a reference to an object, which keeps the object alive for GC. It does not consider a uintptr as such a reference. (That is, while unsafe.Pointer has a pointer type, uintptr has integer type.) [See also the documentation for the unsafe package](https://pkg.go.dev/unsafe).

#### 6. rune

A character is defined using “code points” in Unicode. Go language introduced a new term for this code point called rune.

Go rune is also an alias of type int32 because Go uses UTF-8 encoding. Some interesting points about rune and strings.

Strings are made of bytes and they can contain valid characters that can be represented using runes.
We can use the rune() function to convert string to an array of runes.
For ASCII characters, the rune value will be the same as the byte value.


Finding rune of a character in Go

```go
package main
 
import (
    "fmt"
)
 
func main() {
    s := 'a'
 
    s_rune := rune(s)
     
    fmt.Println(s_rune)
}
```
```
97
```

GoLang String to rune
```go
package main
 
import (
    "fmt"
)
 
func main() {
    s := "GoLang"
 
    s_rune := []rune(s)
    fmt.Println(s_rune) // [71 111 76 97 110 103]
 
}
```

Understanding difference between byte and rune
```go
package main
 
import (
    "fmt"
)
 
func main() {
    s := "GÖ"
 
    s_rune := []rune(s)
    s_byte := []byte(s)
     
    fmt.Println(s_rune)  // [71 214]
    fmt.Println(s_byte)  // [71 195 150]
}
```
-> The special Unicode character Ö rune value is 214 but it’s taking two bytes for encoding.

## Programing fundamentals
- bool type
- numeric type
- string type
- numeral systems
- Constants
- iota
- bit shifing
## Control flow

- loop - int, condition, post
- loop - nesting loops
- loop - for statement
- loop - break & continue 
- loop - printing ascii
- conditional
- loop, conditional, modulus
- switch
## Grouping data
- Array
- Slice - composite literal 
- Slice - for range
- Slice - slicing a slice 
- Slice - append a slice 
- Slice - delete from a slice 
- Slice - make 
- Slice - multi-dimensional slice
- Map - introduction
- Map - add element & range
- Map - delete
## Structs 
- struct
- embedded structs
- anonymous struct
- housekeeping 
## Functions
- Syntax
- Variadic parameter
- Unfurling a slice
- defer
- methods 
- interface & polymorphism
- anonymous func
- func expression 
- return a func
- callback
- closure
- recursion
## Pointers
## Application (json, sort)
- JSON - marshal/unmarshal
- writer interface
- sort 
- sort custom
- bcrypt 
## Context
## Concurrency
- Concurrency vs parallelism 
- Wait group
- Method sets revisited
- Race condition
- Mutex
- Atomic 
## Channels
- Directional channels
- Using channels 
- Range 
- Select
- Comma ok idiom
- Fan in
- Fan out
- Context
## Error handling
- checking errors
- printing and logging
- recover
- error with info
## Writing ducomentation
- go doc
- godoc
## Testing and benchmarking
- table tests
- golint
- benchmark 
- coverage

## Remote go developer jobs
- [X-TEAM](./xteam.md)
- [golangprojects](https://www.golangprojects.com/)