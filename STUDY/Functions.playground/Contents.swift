import UIKit

/*
First Number :
 
Mistakes in 2019

1. In Ipay :-
a. Missing Flat Per Case.
b. Bugs In Edditble Fields (P2P).
c. First and Last Character First Letter Combine.
d. Wrong Time Calculation.
e. Under Pressure.
 
2. Fntasy: Scrolling issue not solved yet.
 
Common Mistakes as Usual:
1.Time Wasting.
2. No Seatting Timly.
3. Watching unnessary movies/song.
 
 //List Of Goals.
 Need To Do.
 1. Time Management.
 2. Deep Focus.
 3. Fear Less.
 4. Fit personalty.
 5. Best Output with all inputs and outputs.
 6. write all posible cases first before picking task.
 7. Strong
 8. Self-Respect.
 9. Purchase a House.
 10. Money.
11. Communicationm Skills.
 
*/
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





