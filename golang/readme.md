# Golang 

## Contents
- [Variables, Values & Type]
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