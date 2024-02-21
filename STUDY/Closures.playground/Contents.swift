import UIKit

/* Closure :

Defination : Closure is a special type of function without any func keyword and without any function name.
or
Closure is a self contained block of functionality that followed in keyword to seprate the statements and returnType.
*/


//Exp 1: Simple Closure expression
/*
let simpleClosure = {

    print(":) This is a closure")
}

simpleClosure() */


//Exp 2: Simple Closure expects an arguments
/*
let simpleClosure : (String) ->() = { name in

    print("This is a \(name)")
}

simpleClosure("Ravi")   */

//Exp 2: Simple Closure expects an arguments and return value
/*
let simpleClosure : (String) ->(String) = { name in

   return "Hello " + name
}

let result = simpleClosure("Ravi")
print(result) */

//Example 3: Passing Closures as a function parameter
/*
func simpleTestClosure(someClosure : ()-> (String), mesg : String ) {
    let result = someClosure()
    print( result + " " + mesg)
}

simpleTestClosure(someClosure: {
    return "Ravi"
}, mesg: "Hi this is my testing")

func someSimpleFunction(someClosure:()->()) {
    someClosure()
    print("Function Called")
}

someSimpleFunction(someClosure: {
    print("Hello World! from closure")
})
*/

//Trailing Closure : if a closure is used as a final or last function argument/parameter to a function , then it's called trailing closure.
//closure experssion looks like function body but in real it's a function argument.
//example : Trailing closure
/*
func someSimpleFunction(msg:String, someClosure:()->()) {
    print(msg)
    someClosure()
}
someSimpleFunction(msg: "Hi Closure") {
    //
}

func someSimpleFunction(msg:String, someClosure:(String)->()) {
    print(msg)
    someClosure("pass value")
}
someSimpleFunction(msg: "Hi Closure") { captureValue in
    //
    print(captureValue)
    
} */


//AutoClosure : when you declare closure with @autoclosure keybord , called autoclosure.
//AutoClosure --- Automatic Closure : - there is no need to wrap closure statements inside the {} curly braces,when calling closures.
/*
func someSimpleFunction(someClosure: @autoclosure ()->(), msg:String) {
    print(msg)
    someClosure()
}
someSimpleFunction(someClosure: (), msg: "Auto")


func whatever(foo: (@autoclosure () -> Int)) {
    let x = foo("Hi This is my closure")
    print(x)
}

whatever{
            return 5 }

 */

//Non Escaping Closure : byDefault all closures are nonescaping. if your closure gets called befor function return , so that is called nonescaping closure.

//For performance optimization , all closures are bydefault Non-escaping.
/*
func testFunctionWithNoEscapingClosure(myClosure:() -> Void) {
    print("function called")
    myClosure()
    return
}


testFunctionWithNoEscapingClosure {
    print("closure get called")
} */

//Escaping Closure : if you pass your closure as a function argument, then you want your closure gets called after function return or outside the function body, so need to escape your closure.
// escape Closure ------ for closure execution, complier needs to maintain a memory.
//Mainly used in async opertaions, becoz in sync opertaion, opertaion execute one by one (top to bottom order) but in asyn opertaion, operation can move to next opertaion without execute firstone, so closure require a memory to execution process, that is maintain by compiler.
/*
var closureArr:[()->()] = []
func testFunctionWithEscapingClosure(myClosure:@escaping () -> Void) {
    print("function called")

    closureArr.append(myClosure)
    myClosure()

    return
}

testFunctionWithEscapingClosure {
     print("closure called")
}
//Calling closure from array
closureArr[0]()

func asyncTestFunctionWithEscapingClosure(myClosure:@escaping () -> Void) {
    DispatchQueue.main.async {
        myClosure()
    }
    return
}

asyncTestFunctionWithEscapingClosure {
    print("closure called")
}
   */

/*
//Closure as a completion handler : to notify/callbacks your taks is done , now you can perform another one.
func doSomeWork(completion:()->()) {
    print("function called")
    print("some work here")
    print("before calling callback")
    completion()
    print("after calling callback")
}


doSomeWork {
    print("call back received")
}

var closeButtonPressed = false
func codeinPlayground(completion:(String)->()) {
    
    print("Code, Take a Nap and Relax")
    if closeButtonPressed {
        completion("Close the playground")
    }
}

codeinPlayground { (msg) in
    print(msg)
}


*/
/******************************* Capture values **************/
//Capture list - capture list is hepls to mantian the memory management.
var variableCount = 0
let increment = { variableCount += 1 } // Captures count implicitly (strong reference)

func someFunctionExample() {
  increment() // This might cause a retain cycle if count is used elsewhere
}
someFunctionExample()

var updateCounter = 0
var newincrement = { [updateCounter]
    updateCounter += 1
} // Copies count's value

func someFunctionExample2() {
    newincrement() // No retain cycle, count's copy is used
}
someFunctionExample2()



var count = 0

var incCounter = {
    count += 1
    print(count)
}

incCounter() // 1
incCounter() // 2

var constCount = 0

var constantIncCounter = { [constCount]
    constCount += 1
    print(constCount)
}
constantIncCounter() // 1


constCount = 2

constantIncCounter() // 3


var anotherConstCount = "0"

let anotherConstantIncCounter = { [anotherConstCount] in
    print("the language : \(anotherConstCount)")
}
anotherConstantIncCounter() // 0


anotherConstCount = "10"

anotherConstantIncCounter() // 10


//Example 1
var language = "objective-c"

let code = { [language] in // consider value instead of reference
    print("the language : \(language)")
}
language = "swift"

code() // the language : objective-c


//Example 2
var newlanguage = "objective-c"
let newcode = { [newlanguage] // without `in` consider orignal reference
    print("the language : \(newlanguage)")
}
newlanguage = "swift"

newcode() // the language : swift


//I'll explain the behavior of in and capture lists in these examples:

//Example 1:

/*

Without in:

The closure captures language by reference, meaning it directly accesses the original variable.
When language is changed to "swift" before calling the closure, the closure sees the updated value and prints "the language: swift".
With in:

The capture list [language] creates a copy of the language variable's value ("objective-c") at the time of the closure's creation.
The closure uses this copied value, which remains unchanged even when the original language is modified.
Hence, the output is "the language: objective-c".

Example 2:

Missing in:
This is a syntax error. The in keyword is mandatory to separate the closure's capture list and its body.
The compiler would not allow this code to run.
Key takeaways:

Capture lists control how closures access variables from their surrounding scope.
Value capture ([variable] in) creates a copy of the variable's value, making the closure independent of changes to the original variable.
Reference capture (in without a capture list) captures a reference to the original variable, so the closure sees changes made to it.
The in keyword is essential for defining a closure's body and separating it from the capture list.
Remember:

Use value capture when you want the closure to work with a fixed value, even if the original variable changes.
Use reference capture when you want the closure to reflect changes to the original variable.
Always include the in keyword to correctly define a closure's structure.

*/
