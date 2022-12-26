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


func whatever(foo: (@autoclosure (String) -> Int)) {
    let x = foo("Hi This is my closure")
    print(x)
}

whatever( foo: {catureValue in
    print(catureValue)
            return 5 }
) */

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
