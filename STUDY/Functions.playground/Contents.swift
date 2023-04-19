import UIKit

//Functions

/*
 Defination : - A function is a set of statements that take input , do some computation and produce output.
 
 Types :
 1. library function : system function like ( print )
 2. userDefine function : created  by user
 
 Calling of functions:
 
 1. Call by value  :  actual can not change.
 2. call by Reference :  by passing reference we can change actual value.
 
 Function can be created as :
 
 1. No Argument and No Return Value. ( func xyz() )
 2. Take Argument and No Return Value. ( func xyz(a: int) )
 3. No Argument and  Return Value. ( func xyz() -> Int )
 4.  Argument and  Return Value. ( func xyz(a: int) -> Int )
 */

//* Q1. Write a program to find min and max values from given array.//
/*
func findMinAndMaxElements(array : [Int]) -> (minElement : Int, maxElement : Int){
    
    if array.count < 0 {
        return (0,0)
    }
    
    var minElement = array[0]
    var maxElement = array[0]
    
    for i in   1..<array.count {
        if minElement > array[i] {
            minElement = array[i]
        }
        if maxElement < array[i] {
            maxElement = array[i]
        }
    }
    return (minElement,maxElement)
}

findMinAndMaxElements(array: [10,20,30,5,2,35]) */

//Nested Functions
//A function that is define iniside the bodies of other function , called as Nested Functions.
/*
func stepCounter(isMoveForward : Bool) -> Int {
    
    func moveForward(step : Int) -> Int {
        return step + 1
    }
    func moveBackward(step : Int) -> Int {
        return step - 1
    }
    return (isMoveForward == true) ? moveForward(step: 2) : moveBackward(step:5)
}

let result = stepCounter(isMoveForward: false)
print(result) */

/*
func stepCounter(isMoveForward : Bool) -> (Int) -> Int {

    func moveForward(step : Int) -> Int {
        return step + 1
    }
    func moveBackward(step : Int) -> Int {
        return step - 1
    }
    //return function
    return (isMoveForward == true) ? moveForward : moveBackward
}

let result = stepCounter(isMoveForward: false)
print(result(12)) */





