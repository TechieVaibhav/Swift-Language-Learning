import UIKit

var greeting = "Hello, playground"


//#MARK Closures :-
// What is closure.
// When to use closure.
// How to use closure.
// escaping and non-escaping closure.

/*****************************************/

/* What is closure :- closure is a special type of function without `func` keyword.
 or
 closure is a self contain block of functionality. */

/* Note: in swift, function is a first class citizen, that meant you can assign a function into a variable. */

/* we can assign a function into a variable like
 
 \* here first we write a function to add 2 numbers: */
 
/*
func addTwoNumber(firstNumber : Int , secondNumber : Int) -> Int {
    
    return firstNumber + secondNumber
}

let result = addTwoNumber(firstNumber: 10, secondNumber: 2)

print(result) // 12

// we will asign function into a variable :
 
let additionTwoInputs = addTwoNumber
 
let resultedValue = additionTwoInputs(109,1)

print(resultedValue) //110
 
 */
 
/*
// ************** How to use closure.**************
// we can write cloure for addition
 
let additionOfTwoNumber : (Int, Int) -> Int = { (firstNumber, secondNumber) in
    
    return firstNumber + secondNumber
}
 
//in keyword is used to seprate the closure body and parameters

let closureresult = additionOfTwoNumber(10,23)

print(closureresult) // 33
 
 */

/*
 // short way to write closure
 
 let additionOfTwoNumberShortWay : (Int, Int) -> Int = {
     
     return $0 + $1
 }
  
let closureResult2 = additionOfTwoNumberShortWay(10,23)

print(closureResult2) // 33

 */


/*
// Another way to write closure

let additionOfTwoNumberAnotherWay : (_ firstNumber : Int, _ secNumber :Int) -> Int = {(_ firstNumber : Int, _ secNumber :Int) -> Int in
    
    return firstNumber + secNumber
}
 
let closureResult3 = additionOfTwoNumberAnotherWay(10,23)

print(closureResult3) // 33

 */

// **************When to use closure.**************

// when we need to perform the heavy operation on background thread like as we have to get the resulted data as json parisng data from api calling.
// Note : used for getting a callback from parlel operations.


/*
// typeallias with closure
// advantage : prevant code duplicacy(if we have to write same closure multiple times, then allias is better way to re-usability)
typealias AdditionClosure = (_ firstNumber : Int, _ secNumber :Int) -> Int
 
 let additionOfTwoNumberAnotherWay : AdditionClosure = {(_ firstNumber : Int, _ secNumber :Int) -> Int in
     
     return firstNumber + secNumber
 }
  
 let closureResult4 = additionOfTwoNumberAnotherWay(10,23)

 print(closureResult4) // 33
 
 */

/*
// we can change the function execution behaviour through closures
// in given situation, we are not passing the `true` but func `printName` takes call, so we can change this type of uncessary calls through closures:

func printGoodMorning(ismorning : Bool, name : String, status : String){
    
    if ismorning{
        print("-> Good Morning \(name)")
    }
    
}

func printName()-> String{
    print("-> printName is called")
    return "Rahul!!"
}

func manStatus()-> String{
    print("-> Rich Man is here")
    return "Rich Man!!"
}
printGoodMorning(ismorning: true, name: printName(), status: manStatus())
printGoodMorning(ismorning: false, name: printName(), status: manStatus())

/*
Output:
-> printName is called
-> Rich Man is here
-> Good Morning Rahul!!
-> printName is called
-> Rich Man is here

-> Note : here 2 uncessory calls, because we don't want printName() & manStatus() if ismorning is false.
*/

func printGoodMorningByClosure(ismorning : Bool, name : () -> String){
    
    if ismorning{
        print("-> Good Morning \(name())")
    }
    
}


printGoodMorningByClosure(ismorning: true) {
    // closure body
    return printName()
}

printGoodMorningByClosure(ismorning: false) {
    // closure body
    return printName()
}
 
*/

/*
// Auto-Closure
// you can omit the closure body by using @autoclosure.
// Over use of @autoclosure can make harder your code readability.

func doSomeCalculation(isCalculate:Bool, with money: @autoclosure ()->Int) {
    if isCalculate{
        print("money is \(money())")
    }
}

doSomeCalculation(isCalculate: true, with: 10) //money is 10

// Note : when we look this function first time, then money looks like a parameter, which makes readabilty harder.
*/

/*
/************  Non-escaping Closure **************/

//Non-escaping Closure : if your closure is called before the function return, that is called nonescaping closure.
// by default all are Non-escaping Closure.

func nonEscapingClosure(work: ()->String) ->String{
    work()
    return "Non-escaping is called before return"
}

nonEscapingClosure {
    //cloure body
    return "it's me Non-escaping"
}

//output:
// "it's me Non-escaping"
// "Non-escaping is called before return"
 */

//Escaping Closure : if your closure is called later the function return, that is called escaping closure.
// here compiler allocate a memory for escaping closure.

func escapingClosure( work: @escaping ()->String) ->String{
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
        let resultValue = work()
        print("resultValue is \(resultValue)")
    }

    return "function doing job"
}
let resultValue = escapingClosure {
    //cloure body
    return "it's me escaping"
}

print(resultValue)
