import UIKit

//Array Declaration Ways :-

let array1: Array<String> = [] // empty array of string

let array2: Array<String> = Array<String>() // empty array of string

var array3: [String] = [] // empty array of string
array3.append("SS") //["SS"]

let array4: [String] = [String]() // empty array of string

let array5: [String] = Array(repeating: "Vaibhav", count: 41)

let array6: [Int] = Array(1..<40)

let array7: [Int] = Array([1,4,6,8,90])

//2D Array
let array8: [[Int]] = Array(arrayLiteral: Array(1...9), Array(8...10))
