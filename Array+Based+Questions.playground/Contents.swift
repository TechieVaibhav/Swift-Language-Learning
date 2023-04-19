import UIKit

// Problem : Sort the given Array

// [1,5,4,3,2]

func sortTheGivenArray(array: inout [Int]){
    for i in 0..<array.count-1{
        for j in (i+1)..<array.count{
            if array[i] > array [j]{
                print("******* swap the values")
                // swap the values
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
    print("*******\(array)*********")
}

var array = [9,1,8,4,5]
sortTheGivenArray(array: &array) // [1, 4, 5, 8, 9]


