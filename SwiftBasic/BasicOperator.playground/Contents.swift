import UIKit

// Unary operator : prefix unary operator and postfix unary operator

//prefix unary :
var x = -1
let positive = -x
print(positive) // 1


//postfix unary :
var y = 1
y += 1
print(y) // 2


//One Side Operator- Range is define only one side either left or right.
// one sided operator : the end range should be defiend. terminate condition is required. one sidede range opertor helps to find out sub array.
// Note : one side operator hepls to find out sub-array.

let array = ["1","2","3","4","5"]

for obj in array[...2]{
    print("\(obj)")
}

/*
 output:
1
2
3
*/


for obj in array[2...2]{
    print("\(obj)")
}

/*
 output: 3
 */


for obj in array[3...]{
    print("\(obj)")
}

/*
 output: 4 5
 */

/***************************/

//Nil-coalsing operator : ??

var a: Int? = nil
var b = 10
let result = a ?? b



let val = "425"

let arr = val.components(separatedBy: ".")
    print(arr)
