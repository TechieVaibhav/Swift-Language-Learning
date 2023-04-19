import UIKit

//High Order Functions
//Map, FlatMap,Reduce,CompactMap,sort, fillter,zip

/*  Why Use High Order Functions :->

1. To make code readable and maintable.
2. To read and understand complex functional programming.
 
 */

//1. Map : loops over a collections and apply the same operation to each and every element in the collection.
//example : F(X) ---> F(x^2)
//syntax : F(x) -- ($0*$0) to F(x^2)
let  inputArrayToMap = [1, 2,4,5,6,7 ]
//First Way
let mapResult = inputArrayToMap.map { (value) -> Int in
    return value * value
}
print("mapResult : -> \(mapResult)")//[1, 4, 16, 25, 36, 49]

//Second Way by shorthand way
let mapResult2 = inputArrayToMap.map {$0 * $0}
print("mapResult : -> \(mapResult2)")//[1, 4, 16, 25, 36, 49]


//2. Filter : loops over a collection and return an array that contains elements that meets the condition.

let  inputArrayToFilter = [1, 2,4,5,6,7 ]
let fillterResult = inputArrayToFilter.filter { (value) -> Bool in
   return value % 2 == 0
}
print("fillterResult : -> \(fillterResult)")//[2, 4, 6]
//Second Way by shorthand way

let fillterResult2 = inputArrayToFilter.filter {$0 % 2 == 0 }
print("fillterResult : -> \(fillterResult2)")//[2, 4, 6]

//3. Reduce : combine all items in the collection and returns a single value.

let  inputArrayToReduce = [1, 2,4,5,6,7 ]
let reduceResult = inputArrayToReduce.reduce(-2) { (value1, val2) -> Int in
    return value1 + val2
}
print("reduceResult : -> \(reduceResult)")//25

let reduceResult1 = inputArrayToReduce.reduce(0, +)
print("reduceResult : -> \(reduceResult1)")//25

let reduceResult2 = inputArrayToReduce.reduce(78, +)
print("reduceResult : -> \(reduceResult2)")//103

let  inputArrayToReduce2 : [String] = ["Hello" ,"World"]
let reduceResult3 = inputArrayToReduce2.reduce("", +)
print("reduceResult : -> \(reduceResult3)")//HelloWorld

//Sort : to sort the collection
var array = [1, 7,2,4,5,6 ]
let  inputArrayToSort: [Int] = array.sorted()
array.sort { (valu1, valu2) -> Bool in
    return valu1 > valu2
}
//- Complexity: O(*n* log *n*), where *n* is the length of the collection.
print("inputArrayToSort : \(inputArrayToSort)")//[1, 2, 4, 5, 6, 7]

//FlatMap : convert collection of collection to flattens.(सपाट)
var twoDiamentionalInputArrayToFlatMap = [[1, 7,2], [4,5,6]]
let resultedFlatMap = twoDiamentionalInputArrayToFlatMap.flatMap { (value : [Int]) -> [Int] in
    return value
}
print("resultedFlatMap : \(resultedFlatMap)")//1D: [1, 7, 2, 4, 5, 6]

var threeDiamentionalInputArrayToFlatMap = [ [[1, 7,2], [4,5,6]] ]
let resultedFlatMap2 = threeDiamentionalInputArrayToFlatMap.flatMap { (value : [[Int]]) -> [[Int]] in
    return value
}
print("resultedFlatMap : \(resultedFlatMap2)")//2D: [[1, 7, 2], [4, 5, 6]]


/*
var diamentionalInputArrayToFlatMap =  [[1, 7,nil], [4,5,6]]
let resultedFlatMap3 = diamentionalInputArrayToFlatMap.flatMap { (value : [Int]) -> [Int] in
    return value
}
print("resultedFlatMap : \(resultedFlatMap3)")//Cannot convert value of type '([Int]) -> [Int]' to expected argument type '([Int?]) throws -> [Int]'
 */
//compactMap : transform then unwrap

var inputArray : [Int?] = [1,nil, 2,3,4,5,56, nil]
let outArray = inputArray.compactMap { (value) -> Int? in
    return value ?? 0 * 2
}
let outArray2 = inputArray.compactMap { (value) -> Int? in
    return value
}
print("outArray : \(outArray)")//[1, 0, 2, 3, 4, 5, 56, 0]

print("outArray : \(outArray2)")//[1, 2, 3, 4, 5, 56]

var inputArray2 : [String?] = ["12",nil, "2", nil]
let outArray3 = inputArray2.compactMap({$0})
print("outArray : \(outArray3)")//[12, 2]


// wrte a custom High order function

extension Sequence{
    func myForEach(complition : (Element)-> Void) {
        for e in self{
            complition(e)
        }
    }
    
    func myCustomMap<Transform>(transaform : (Element) -> Transform) -> [Transform] {
        var arr = [Transform]()
        forEach { element in
            arr.append(transaform(element))
        }
        return arr
    }
    
    func myCustomCompactMap<Transform>(transaform : (Element) -> Transform?) -> [Transform] {
        var arr = [Transform]()
        forEach { element in
            if let unwrapedValue = transaform(element){
                arr.append(unwrapedValue)
            }
        }
        return arr
    }
}

[1,2,3,4].myForEach { element in
    print(element)
}

let res = ["1","2","3","4","w"].myCustomMap { element in
    return Int(element)
}
print(res)

let res2 = ["1","2","3","4", "abc"].myCustomCompactMap { element in
    return Int(element)
}
print(res2)
