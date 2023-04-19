import UIKit

// Problem statement : Find the second larget number.


var array = [10,20,30,5,6]

/******** findTheLargetNumber *************/

func findTheLargetNumber(arr : [Int]) -> Int {
    
    var max = arr.first ?? 0
    
    for  i in 0..<arr.count{
        if arr[i] > max {
            max = arr[i]
        }
        
    }
    
    return max
    
}

// findTheLargetNumber(arr: array) // 90

/******** findMinimumElement *************/
func findMinimumElement(arr : [Int]) -> Int{
    var min = arr.first ?? 0
    
    for i in 0..<arr.count {
        if arr[i] < min {
            min = arr[i]
        }
    }
    
    return min
}

findMinimumElement(arr: array)

/******** findTheSecondLargetNumber *************/
func findTheSecondLargetNumber(arr : [Int]) -> Int {
    
    var max = findMinimumElement(arr: arr)
    var secondMax = findMinimumElement(arr: arr)
    
    for  i in 0..<arr.count{
        if arr[i] > max {
            secondMax = max
            max = arr[i]
        }
        if arr[i] < max && arr[i] > secondMax {
            secondMax = arr[i]
        }
    }
    
    return secondMax
    
}

 findTheSecondLargetNumber(arr: array)






/******** findSecondMinimumElement *************/
func findSecondMinimumElement(arr : [Int]) -> Int{
    var min = findTheLargetNumber(arr: arr)
    var secondMin = findTheLargetNumber(arr: arr)
    
    for i in 0..<arr.count {
        if arr[i] < min {
            secondMin = min
            min = arr[i]
        }
        
        if arr[i] > min && arr[i] < secondMin {
            secondMin = arr[i]
        }
    }
    
    return secondMin
}
findSecondMinimumElement(arr: array)


/******** sorting *************/

func sortTheArray(arr : inout [Int]) {
    
    for i in 0..<arr.count {
        
        for j in (i+1)..<arr.count{
            if arr[i] > arr[j]{
                let temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }
    
}

var arr2 = [09,90,80,70]
sortTheArray(arr: &arr2)


