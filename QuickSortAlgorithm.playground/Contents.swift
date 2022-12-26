import UIKit



func QuickSort(array: inout [Int], l: Int, h : Int) -> [Int]{
    if l < h {
        let pivot = partioning(array: &array, l: l, h: h)
        QuickSort(array: &array, l: l, h: pivot - 1)
        QuickSort(array: &array, l: pivot + 1, h: h)
    }
    return array
}



func partioning(array: inout [Int], l : Int, h : Int) -> Int{
    let pivot = array[l]
    var i = l
    var j = h
    while i < j {
        while array[i] <= pivot{
            i += 1
            if i >= array.count {
                i = array.count - 1
                break
            }
            print("i value is :-\(i)")
        }
        while array[j] > pivot{
            print("j value is :-\(j)")
            j -= 1
        }
        if i < j {
            array = swap(array: &array, i: i, j: j)
        }
    }
    array = swap(array: &array, i: j, j: l)
    //position of pivot element
    return j
}


func swap(array : inout [Int], i : Int, j : Int) -> [Int]{
    
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
    return array
}

var array = [1,9,3,2,6]
let h = array.count - 1
print("final array : \(QuickSort(array: &array, l: 0, h: h))") // [1, 2, 3, 6, 9]

//Time Complexity : O(nlogn) best case
//                 : O(n^2) worst case (when array is not divided into same size sub problems)

//Analysis : n size problem
/*
                     n
                  /     \
                n/2      n/2
                /  \      / \
               n/4 n/4   n/4 n/4
 
 so as per n is devided into 2 sub problems,
      n/2^k = 1
      n = 2^K
 taking logs
 
    logn = k
 
 so in every step there is logn steps and total steps is n, so n * logn
 
=>  n * logn
 */
 



