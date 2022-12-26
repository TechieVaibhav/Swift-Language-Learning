import UIKit

//Problem Statement: Merge the 2 sorted array.

func mergeTwoSortedArray(arr1: [Int], arr2:[Int]) -> [Int] {
    let len1 = arr1.count
    let len2 = arr2.count
    print("len1 : \(len1)")
    var finalyArray:[Int] = []
    
    var index1: Int = 0
    var index2: Int = 0
    var mainArrIndex = 0
    
    while index1 < len1 && index2 < len2 {
       
        if arr1[index1] < arr2[index2] {
            finalyArray.insert(arr1[index1], at: mainArrIndex)
            mainArrIndex += 1
            index1 += 1
            print("index1 : \(index1)")
        } else{
            print("***index2 : \(index2)")
            finalyArray.insert(arr2[index2], at: mainArrIndex)
             mainArrIndex += 1
             index2 += 1
        }
    }
  
    while index1 < len1 {
        finalyArray.insert(arr1[index1], at: mainArrIndex)
        index1 += 1
        mainArrIndex += 1
    }
    while index2 < len2 {
        finalyArray.insert(arr2[index2], at: mainArrIndex)
        mainArrIndex += 1
        index2 += 1
    }
    
    return finalyArray
}


let resultedArray = mergeTwoSortedArray(arr1: [0], arr2: [0])
print("resultedArray :- \(resultedArray)")
