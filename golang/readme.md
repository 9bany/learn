# Golang 

## Contents
- [Programing fundamentals](#programing-fundamentals)
    - [Variable declaration](#variable-declaration)
    - [Basic syntax](#basic-syntax)
    - [Data types and structures](#data-types-and-structures)
    - [Flow control structures](#flow-control-structures)
    - [Sequential](#sequential)
    - [Selection (conditionals)](#selection-conditionals)
    - [Iteration (Loops)](#iteration-loops)
    - [Functional programming](#functional-programming)
    - [Object-oriented programming](#object-oriented-programming)
    - [Debuging ](#debuging)
    - [IDEs and Coding Environments](#ides-and-coding-environments)
    - [Bit shifing](#bit-shifing)
    - [iota](#iota)
- [Variables, Values & Type](#variables-values--type)
    - [Variables](#variables)
    - [Values](#values)
    - [Type](#type)
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
## Programing fundamentals
### Variable declaration

`Variables` are containers for storing data values, a memory location for a data type. Variables are created using a declaration or keyword that varies across languages.

Variable names are usually alphanumeric, that is, they contain a-z and 0-9. They can also include special characters like underscore or the dollar sign.

Variables can hold values of any data type supported by the programming language. This value may change during program execution.
### Basic syntax

```go 
package main

import "fmt"

func main() {
    fmt.Println("Hello world")
}
```
### Data types and structures.

- Types: 
    -String
    - Boolean (true or false)
    - Numbers, which includes integers (whole numbers from 1) and floating-point numbers (decimal-base)
    - Characters (includes single alphabets or numbers)
    - Arrays (a collection of data, usually of the same data type)

- Structures:
    - Stacks
    - Heaps
    - Trees
    - Linked lists
    - Queues
    - Arrays
    - Tables
    - Graphs
### Flow control structures

They are commands that allow a program to “decide” to take one direction or another.

There are three basic types of control structures: sequential, selection, and iteration.
### Sequential
It involves the execution of code statements one after the other. A real-world example is following a cooking recipe.
<p align="center">
  <img src="assets/1-2.png" alt="Sublime's custom image" width="250"/>
</p>

### Selection (conditionals)

The computer decides what action to perform based on the result of a test or condition equalling true or false.
<p align="center">
  <img src="assets/1-1.png" alt="Sublime's custom image" width="300"/>
</p>

### Iteration (Loops).

A loop is a programming structure that allows a statement or block of code to be run repeatedly until a specified condition is no longer true (will return Boolean, true or false). It is one of the most powerful and fundamental programming concepts.

<p align="center">
  <img src="assets/1-0.png" alt="Sublime's custom image" width="350"/>
</p>

### Functional programming

Functions are containers that take in a set of inputs and return an output. It is not required for a function to return a value. Pure functions will always give the same result for the same set of inputs.

Functional Programming is a straightforward method of building software that involves using pure functions. This method eliminates the occurrence of data mutation or side effects.
### Object-oriented programming

***Object-Oriented Programming (OOP)*** is a programming concept that revolves around ‘objects’ and `methods`.

There are four principles of OOP:

- Inheritance
- Polymorphism
- Abstraction
- Encapsulation
### Debuging 
Debugging is a crucial skill. It involves detecting and removing existing and potential errors, defects, or ‘loopholes’ in one’s code.
### IDEs and Coding Environments

IDE stands for Integrated Development Environment

Some common examples of IDE’s are:

- Visual Studio code
- ...

### Bit shifing

#### The Operators
- `>>` is the arithmetic (or signed) right shift operator.
- `>>>` is the logical (or unsigned) right shift operator.
- `<<` is the left shift operator, and meets the needs of both logical and arithmetic shifts.

All of these operators can be applied to integer values (int, long, possibly short and byte or char). In some languages, applying the shift operators to any datatype smaller than int automatically resizes the operand to be an int.

Note that `<<<` is not an operator, because it would be redundant.

Also note that C and C++ do not distinguish between the right shift operators. They provide only the >> operator, and the right-shifting behavior is implementation defined for signed types. The rest of the answer uses the C# / Java operators.

#### Left shift (<<)

Integers are stored, in memory, as a series of bits. For example, the number `6` stored as a 32-bit `int` would be:

```
00000000 00000000 00000000 00000110
```

Shifting this bit pattern to the left one position (`6 << 1`) would result in the number 12:
```
00000000 00000000 00000000 00001100
```

As you can see, the digits have shifted to the left by one position, and the last digit on the right is filled with a zero. You might also note that shifting left is equivalent to multiplication by powers of 2. So `6 << 1` is equivalent to `6 * 2`, and `6 << 3` is equivalent to `6 * 8`. A good optimizing compiler will replace multiplications with shifts when possible.

#### Non-circular shifting

Please note that these are not circular shifts. Shifting this value to the left by one position (`3,758,096,384 << 1`):

```
11100000 00000000 00000000 00000000
```

results in 3,221,225,472:
```
11000000 00000000 00000000 00000000
```
The digit that gets shifted "off the end" is lost. It does not wrap around.

#### Logical right shift (>>>)
A logical right shift is the converse to the left shift. Rather than moving bits to the left, they simply move to the right. For example, shifting the number 12:
```
00000000 00000000 00000000 00001100
```

to the right by one position (12 >>> 1) will get back our original 6:
```
00000000 00000000 00000000 00000110
```
So we see that shifting to the right is equivalent to division by powers of 2.

#### Lost bits are gone
However, a shift cannot reclaim "lost" bits. For example, if we shift this pattern:
```
00111000 00000000 00000000 00000110
```
to the left 4 positions (`939,524,102 << 4`), we get `2,147,483,744`:
```
10000000 00000000 00000000 01100000
```
and then shifting back (`(939,524,102 << 4) >>> 4`) we get `134,217,734`:
```
00001000 00000000 00000000 00000110
```
We cannot get back our original value once we have lost bits.


#### Arithmetic right shift (>>)

The arithmetic right shift is exactly like the logical right shift, except instead of padding with zero, it pads with the most significant bit. This is because the most significant bit is the sign bit, or the bit that distinguishes positive and negative numbers. By padding with the most significant bit, the arithmetic right shift is sign-preserving.

For example, if we interpret this bit pattern as a negative number:
```
10000000 00000000 00000000 01100000
```
we have the number `-2,147,483,552`. Shifting this to the right 4 positions with the arithmetic shift (`-2,147,483,552 >> 4`) would give us:
```
11111000 00000000 00000000 00000110
```
or the number `-134,217,722.`

So we see that we have preserved the sign of our negative numbers by using the arithmetic right shift, rather than the logical right shift. And once again, we see that we are performing division by powers of 2.

### iota

- The iota keyword represents successive integer constants 0, 1, 2,…
- It resets to 0 whenever the word const appears in the source code,
- and increments after each const specification.

#### Basic exmaple
```go
package main 

const (
    a = iota 
    b
    c
)
```

#### Start from one

```go
package main 

const (
    a = iota + 1
    b
    c
)
```

#### Skip value
```go
package main 

const (
    a = iota 
    _
    b
    c
)
```
#### Complete enum type with strings [best practice]
Here’s an idiomatic way to implement an enumerated type:

- Create a new integer type,
- List its values using iota,
- Give the type a String function.

```go
type Direction int

const (
    North Direction = iota
    East
    South
    West
)

func (d Direction) String() string {
    return [...]string{"North", "East", "South", "West"}[d]
}
```
Use 
```go
var d Direction = North
fmt.Print(d)
switch d {
case North:
    fmt.Println(" goes up.")
    fmt.Println(d.String())
case South:
    fmt.Println(" goes down.")
    fmt.Println(d.String())
default:
    fmt.Println(" stays put.")
    fmt.Println(d.String())
}
// Output: North goes up.
```
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

`uintptr` is there to bypass the type system and allow the Go implementors to write Go runtime libraries, including the garbage collection system, in Go, and to call C-callable code including system calls using C pointers that are not handled by Go at all.

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


## Control flow
### If/else

Here’s a basic example.
```go
if 7%2 == 0 {
    fmt.Println("7 is even")
} else {
    fmt.Println("7 is odd")
}
```
You can have an if statement without an else.
```go
if 8%4 == 0 {
    fmt.Println("8 is divisible by 4")
}
```
A statement can precede conditionals; any variables declared in this statement are available in all branches.
```go
if num := 9; num < 0 {
    fmt.Println(num, "is negative")
} else if num < 10 {
    fmt.Println(num, "has 1 digit")
} else {
    fmt.Println(num, "has multiple digits")
}
```
### Switch

Here’s a basic switch.

```go
i := 2
fmt.Print("Write ", i, " as ")
switch i {
case 1:
    fmt.Println("one")
case 2:
    fmt.Println("two")
case 3:
    fmt.Println("three")
}
```

You can use commas to separate multiple expressions in the same case statement. We use the optional default case in this example as well.
```go
    switch time.Now().Weekday() {
    case time.Saturday, time.Sunday:
        fmt.Println("It's the weekend")
    default:
        fmt.Println("It's a weekday")
    }
```

Switch without an expression is an alternate way to express if/else logic. Here we also show how the case expressions can be non-constants.

```go
    t := time.Now()
    switch {
    case t.Hour() < 12:
        fmt.Println("It's before noon")
    default:
        fmt.Println("It's after noon")
    }
```
A type switch compares types instead of values. You can use this to discover the type of an interface value. In this example, the variable t will have the type corresponding to its clause.
```go
    whatAmI := func(i interface{}) {
        switch t := i.(type) {
        case bool:
            fmt.Println("I'm a bool")
        case int:
            fmt.Println("I'm an int")
        default:
            fmt.Printf("Don't know type %T\n", t)
        }
    }
    whatAmI(true)
    whatAmI(1)
    whatAmI("hey")
```
## Grouping data
### Array

Here we create an array a that will hold exactly 5 ints. The type of elements and length are both part of the array’s type. By default an array is zero-valued, which for ints means 0s
```go 
    var a [5]int
    fmt.Println("emp:", a)
```
We can set a value at an index using the `array[index] = value` syntax, and get a value with `array[index]`.
```go
    a[4] = 100
    fmt.Println("set:", a)
    fmt.Println("get:", a[4])
```

The builtin len returns the length of an array.
```go
    fmt.Println("len:", len(a))
```
Use this syntax to declare and initialize an array in one line.
```go
    b := [5]int{1, 2, 3, 4, 5}
    fmt.Println("dcl:", b)
```
Array types are one-dimensional, but you can compose types to build multi-dimensional data structures.
```go
    var twoD [2][3]int
    for i := 0; i < 2; i++ {
        for j := 0; j < 3; j++ {
            twoD[i][j] = i + j
        }
    }
    fmt.Println("2d: ", twoD)
```
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