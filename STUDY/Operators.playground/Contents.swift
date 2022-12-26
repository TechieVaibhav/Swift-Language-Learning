import UIKit

//Operators : write less,  produce more
//1. Binary Opertaors -- +/-%*
//2. Unary Operators ---!
//3. Nil Coalescing -- ??
//4. ternary operators -- a ? b : c

//1. Binary Operators
/*
1 + 3
4 - 2
5%4
*/


//2. Unary Operators ---!
!true
!false



//3. ternary operators
var a : Int? =  10
var b : Int?  = 10
var c : Int = 20

let result = (a != nil) ? b : c // 10



//4.Nil Coalescing
var xyz : Int?
let resultValue = xyz ?? 10 // 10

