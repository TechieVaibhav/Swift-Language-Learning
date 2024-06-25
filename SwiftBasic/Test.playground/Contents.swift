import UIKit

// arr 1,2,3,4,8,10,7,5,11,12,2,9,11,1,2,12,14
// lent = 3
// max numer
/*
 func findMaxSum(inputArray : [Int]) {
 let aset = Set(inputArray)
 let sortedArray = Array(aset).sorted()
 var r = sortedArray.count
 var sum = 0
 for _ in 0..<3{
 r = r - 1
 sum = sum + sortedArray[r]
 }
 print(sum)

 }

 let arr  = [1,2,3,4,8,10,7,5,11,12,2,9,11,1,2,12,14]
 findMaxSum(inputArray: arr)
 */

//Array -- 2,3,4

// 0 - 2, 3 * 4 = 12
// 1 - 3, 4 * 2 = 8
// 2 - 4, 2 * 3 = 6

// (n/2) * n == n -- even number

//aarr == 1,2,3,4,5,7,7,7,7,7

func findOccurance(inputArray : [Int]) {
    var hashMap : [Int: Int] = [:]
    var resultCounter = 0
    var occuredkey = 0
    for num in inputArray{
        hashMap[num, default: 0] += 1
    }

    for key in hashMap.keys{
        if let count = hashMap[key],  count > resultCounter{
            resultCounter = count
            occuredkey = key
        }
    }
    print(occuredkey, resultCounter)
}

findOccurance(inputArray: [1,2,2,2,3,3,3])
