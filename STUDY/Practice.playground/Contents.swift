import UIKit

var str = "Hello, playground"

//***********************Addition Of 2 Number By Closure ***********************************//
/*
//1. addition of 2 number closure
let addition: (Int, Int) -> Int = { (val1, val2) in
    return val1 + val2
}
addition(1, 2)
*/
//******************************* MAP ***************************//
/*
let collection = [1,3,4,5,6]
let mapedResult = collection.map { (value)  in
    return value * value
}
*/

//**********************************************************//

//******************************* Flat MAP ***************************//
//collection of collection flattern(level)
    /*
let collectionOfCollection = [[1,3,4,5,6], [8,9,0]]
let mapedResult = collectionOfCollection.flatMap { (nestedArray)  in
    return nestedArray
} // [1, 3, 4, 5, 6, 8, 9, 0]
*/
//**********************************************************//

//******************************* Compact MAP ***************************//
/*
//for non-optional result
let collectionOfCollection = [1,3,4,5,6, 8,9,0,nil,23]
let mapedResult = collectionOfCollection.compactMap { (value)  in
    return value
}
print(mapedResult)//[1, 3, 4, 5, 6, 8, 9, 0, 23]
    */
//**********************************************************//

//******************************* Filter ***************************//
/*
//includes nil (all elements which statisfy the given condition)
let collectionOfCollection = [1,3,4,5,6, 8,9,0,nil,23]
let filterResult = collectionOfCollection.filter { (value)  in
    return (value ?? 0) % 2 == 0
}
print(filterResult)//[Optional(4), Optional(6), Optional(8), Optional(0), nil]
*/
//**********************************************************//
//******************************* reduce ***************************//
/*
//includes nil (all elements which statisfy the given condition)
let collection = [1,3,4,5,6, 8,9,0,nil,23]
let reduceResult = collection.reduce(0) { (val1, val2)  in
    return val1 + (val2 ?? 0)
}
print(reduceResult)//59
*/
//**********************************************************//
//******************************* sort ***************************//
/*
//includes nil (all elements which statisfy the given condition)
var givenArray = [1,3,4,5,6, nil,8,9,23]
let filnal : [Int?] = givenArray.sorted { (val1, val2)  in
    return (val1 ?? 0) > (val2 ?? 0)
}
print(filnal)//[Optional(23), Optional(9), Optional(8), Optional(6), Optional(5), Optional(4), Optional(3), Optional(1), nil]

//**********************************************************//
*/


