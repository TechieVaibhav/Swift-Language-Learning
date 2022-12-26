import UIKit

//Leanear Search/Seqential Search : objective to search or find the data or given key into the array.
// always start from zero index and goes to till end index to search the item into array.

// Array : [1,4,2,5,9,6,17,15]
// Find out the position of 15 into the array.
// Note : position  = index of that item + 1.
func findTheDataIntoArrayByLeanearSearch(arr : [Int], data : Int){
    let length = arr.count
    var isDataFound : Bool = false
    for index in 0..<length {
        if arr[index] == data {
            isDataFound = true
            print("thee item is found at position : \(index + 1)")
        }
    }
    if  !isDataFound{
        print("the data item is not found")
    }
}


//findTheDataIntoArrayByLeanearSearch(arr:[1,3,6,5,66,2,4], data: 5)
//Time complexity : O(n)
//Space Complexity : O(1)


//2. data searched 5, 1
//input array: 1 2 3 4 1
// return -1 if data not found into array.
func findSolution(arr: [Int], data : Int) -> Int{
    var isDataFound : Int = -1
    let length = arr.count
    for index in 0..<length{
        if data == arr[index] {
            //index + 1 => just for position
            isDataFound = index + 1
        }
    }
    return isDataFound
}
//findSolution(arr: [1, 2, 3, 4, 1], data: 1)


// Recurion way of linear search
// 3 steps :
//1. find the termination condition.
//2. find the sub problem.
//3. make a genric logic.

//1. find the termination condition : we can treat -1 as a termination condition if size is zero.
// 2. SUB PROBLEM : array's index data should me matched for result.
// 3. writre a genric logic.

func linearSearch(arr: [Int], data: Int, index : inout Int) -> Int{
    if arr.count == 0 {
        return -1
    }
    //to prevent overflow
    if index == arr.count {
        return -1
    }
    if arr[index] == data{
        return index
    } else {
        index += 1
        return linearSearch(arr: arr, data: data, index: &index)
    }
}

var index = 0
let result = linearSearch(arr: [1,3,4,6,5], data: 5, index: &index)

if result == -1 {
    print("Search element not found in array")
} else {
    print("Element is found at index: \(result) & position: \(result + 1)")
}

