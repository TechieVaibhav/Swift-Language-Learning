import UIKit

// Qustion KVC, KVO NSdictionary se Value/Object For Key differ

//The Basics
//Basic Operators
//Strings and Characters
//Collection Types


//Control Flow
//Functions
//Closures
//Enumerations
//Structures and Classes
//Properties
//Methods
//Subscripts
//Inheritance
//Initialization
//Deinitialization
//Optional Chaining
//Error Handling
//Concurrency
//Type Casting
//Nested Types
//Extensions
//Protocols
//Generics
//Opaque Types
//Automatic Reference Counting
//Memory Safety
//Access Control
//Advanced Operators


//Basics
//let x = 0 // never change
//var y =  10
//y = 20// update








//Basic Operators
// binary  opertors ( + - * % \) -- target 2 operands --- 10 + 20
// logic  --   !=  &&

//--- 10 * 20
// ternary opertaors , target 3 operands a,b & c (  a ? b : c ) -- a is true then choose b otherwise chosse c

var a = 10
let result = (a > 12) ? true : false // false

// nil coalsing -- a and b operands -- ??

var a1 : Int?
var b = 20
let result2 = a1 ?? b // default value



// unary --- (!)
// !true !false

// !false -- f and f
// !true -- f and t


//Strings

///string --- collection of chracters

// "ababa" --- character ki colletion


// string interpolation --- mixxed string --- contants & character --- "abab123" --

// string concateination -- "abc" "pop" ==> "abcpop" --- "abc" + "pop"

// Characters ===> Unicode scaler -- C -- unque code scaler code
//
//var my = "cbcbc"
//
//for ch in my {
//
//    print(ch)
//}


//Collection Types === array , dictiobnary, set
//array  -- collection of similar data
//var array = [1,3,45,56]
////
//var array2 : [Int]?
//
//array2 = [1,3,45,56]
//
//for obj in array {
//    print(obj)
//}

//var array = [1,3,45,56]
//let result33 = array + array // array contatination

// dictiobnary -- key value deal

var dict = ["abc" : 90, "mnv" : 80]

var dict2 : Dictionary<String, Int>?

dict2 = ["abc" : 90, "mnv" : 80]

var dict3 : [String: Int]

dict3 = ["abc" : 90, "mnv222" : 80]
// add new value
dict3["jk"] = 190

print(dict3)

dict3.values // array all values
dict3.keys // array keys


dict3.removeValue(forKey: "abc")


(dict3 as NSDictionary).object(forKey: "mnv222")
(dict3 as NSDictionary).value(forKey: "mnv222")

// dict [key ] --> value fast process -- O(1) -- constant time
// Array ---> access index -- O(1)
// Array -> beginging, middle ---> O(n) , last ---> O(1)

// Set -- collection of elements

//Set opertaions -- Union (A + B), Insert ( add new ), intersection ( common b/w A and B), subtract (A - B)
var aSet: Set = Set<Int>()
aSet = [1,3,4,5,6]

print(aSet)

// -- Order change maintain nhi hota
// -- dupliocate items nhi hote
// subscript supoprt nhin krta unlike array

var bSet : Set = [790, 90]
//aSet + bSet// contatination

aSet.union(bSet)
let rem = aSet.intersection(bSet)
print(rem)
aSet.subtract(bSet)



// Control Flow -- if,  else, while , foor loop, switch, fallthrough , repeat while, 1...5, stride, repeat {
//statements
//} while condition, Tuples, Value Bindings, Where, Compound Cases, fallthrough, throw, Early Exit

var x = 6
//while x > 0 {
//    x = x - 1
//    print(x)
//}

repeat {
    x = x - 1
    print(x)
} while x > 6 // condition bad me check hoti hai

//foor loop
var ar23 = [9,0,80]

ar23.forEach { (value) in
    print(value)
}

// ranges -- closed range -- ... ==> a...b == loop start a input and unitll b but also takes b == 1...5 = 1,2,3,4, 5

// half open range -- ..< ==  takes a but never takes b , 1..<5, 1,2,3,4

// fallthrough

var xCordinator = 12

switch xCordinator {
case 17:
    
    print("OK")
    print("OK")
    print("OK")
    print("OK")
    fallthrough
case 14:
    print("OK1")
case 12:
    print("OK2")
    fallthrough
default:
    print("default")
}


//Tuples
let xuy = (x: 190 , h : 98)

xuy.0

Int("+")
