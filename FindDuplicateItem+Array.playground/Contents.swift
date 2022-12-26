import UIKit

/*

 Given an array of n elements that contains elements from 0 to n-1, with any of these numbers appearing any number of times. Find these repeating numbers in O(n) and using only constant memory space.

Example:

Input : n = 7 and array[] = {1, 2, 3, 6, 3, 6, 1}
Output: 1, 3, 6

Explanation: The numbers 1 , 3 and 6 appears more
than once in the array.

Input : n = 5 and array[] = {1, 2, 3, 4 ,3}
Output: 3

Explanation: The number 3 appears more than once
in the array.
 
*/
//First Approach By Hashmaping
func findDuplicateNumber(arr: [Int]) {
    var dict:[Int : Bool] = [:]
    for i in 0..<arr.count{
        for j in i+1..<arr.count{
            if arr[i] == arr[j]{
                dict[arr[j]] = true
            }
        }
    }
    print("dict value : \(String(describing: dict.keys.sorted()))")
   
}

//Find duplicates in O(n) time and O(1) extra space
//findDuplicateNumber(arr: [1,3,4,1,1,2,3,4])
// Space : O(n)
// Time : O(n^2)


 
//Second Approach By
func secondWayToFindDuplicateNumber(arr: inout [Int]) {
    for i in 0..<arr.count{
        let abs_val = abs(arr[i])
        if arr[abs_val] < 0 {
            print("The duplicate item is : \(abs(arr[i]))")
        } else {
            arr[abs_val] = (-1) * arr[abs_val]
        }
    }
    print(arr)
}

//var inputArray = [1,2,3,1,4,5,6,3]
//secondWayToFindDuplicateNumber(arr: &inputArray)
 // Space : O(1)
 // Time : O(n)
 // Note : Array is modified here.

 
//Third Approach if Array is constarint to not modify
func thirdApproachLinkedListFormFindDuplicate(arr : [Int]) -> Int{
    var slowPointer = arr[0]
    var fastPointer = arr[0]
    
    repeat{
     slowPointer = arr[slowPointer]
     fastPointer = arr[arr[fastPointer]]
    }while(slowPointer != fastPointer)
    fastPointer = arr[0]
    
    repeat {
        slowPointer = arr[slowPointer]
        fastPointer = arr[fastPointer]
    } while (slowPointer != fastPointer)
    
    return slowPointer
}



// print("\(thirdApproachLinkedListFormFindDuplicate(arr: [1,2,3,4,5,6,3]))")
// 3
// Time O(n)
// Space O(1)
