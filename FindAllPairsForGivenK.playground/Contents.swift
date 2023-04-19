import UIKit

// Problem1 : Find pairs with sorted array

func printAllPairs(arr : inout [Int], findingKey : Int) {
    if (arr.count == 0){
        return
    }
    var leftPointer = 0
    var rightPointer = arr.count - 1
    arr.sort()
    while leftPointer < rightPointer {
        let sum = arr[leftPointer] + arr[rightPointer]
        if sum == findingKey {
            print("pairs : \(arr[leftPointer]) \(arr[rightPointer])")
            leftPointer += 1
        }else if sum > findingKey{
            rightPointer -= 1
            
        }else if sum < findingKey{
            leftPointer += 1
        }
    }

}

var array = [2,1,9,8]
var k = 10

//out : {2,8} {1,9}
printAllPairs(arr: &array,findingKey: k)


var problem2 = [1,2,3,4,5,6,7]
let finder2 = 7
//out : {1 6} {2 5} {3 4}
printAllPairs(arr: &problem2, findingKey: finder2)



var problem3 = [9,4,5,1,2,6,7]
let finder3 = 8
//out : {1 7} {2 6}
printAllPairs(arr: &problem3, findingKey: finder3)











