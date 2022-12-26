import UIKit

// Problem : Sort the given Array

// [1,5,4,3,2]
/*
func sortTheGivenArray(array: inout [Int]){
    for _ in 0..<array.count-1{
        for j in 0..<array.count-1{
            if array[j] > array [j+1]{
                print("******* swap the values")
                // swap the values
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
            }
        }
    }
    print("*******\(array)*********")
}

var array = [9,1,8,4,5]
sortTheGivenArray(array: &array) // [1, 4, 5, 8, 9]
*/

