import UIKit

var str = "Hello, playground"
/*
//Question 1. Reverse a given string without reversed() Function.
let givenString = "Ramu Ral"

/*********************************************************/
let result = reversedString(givenStr: givenString)
print("Result :-> \(result)")
 */
/*

*/
/*


//Question 4. Given an array A[] and a number K, check for pair in A[] with sum as K.
//Complexity -- O(n^2)
func findPairsWhoseSumEqualsToGivenNumber(array : [Int], k: Int ) {
    for i  in 0..<array.count {
        for j  in (i+1)..<array.count {
            if array[i] + array[j] == k {
                print("Founded Pairs : \(array[i]),  \(array[j])  ")
            }
        }
    }
}

//findPairsWhoseSumEqualsToGivenNumber(array: [20,10,9,8,14,7,5], k: 15)
func findPairsWhoseSumEqualsToGivenNumber2(array : [Int], k: Int ) {
    var hash_set : Set = Set<Int>()
    for i  in 0..<array.count {
        let diff = k - array[i]
        print("diff  :   \(diff) ")
        if hash_set.contains(diff) {
            print("Founded Pairs : \(array[i]),  \(diff) ")
        }
        hash_set.insert(array[i])
    }
}

findPairsWhoseSumEqualsToGivenNumber2(array: [1,3,5,10,15,9,6], k: 15)



func reversedString(givenStr : String) -> String{
    //given string convert characters ke array me
    var reversedCharacterArray = [Character]()
    
    for ch in givenStr {
        reversedCharacterArray.insert(ch, at: 0)
    }
    return String(reversedCharacterArray)
}
*/

 //Question 3. Print Characters And Their Frequencies In Order Of Occurrence.
 func printNumberFrequency(inputNumbers : [Int]) {
     var hash_map = Dictionary<Int, Int>()
     for number in inputNumbers {
         if let counter = hash_map[number] {
             hash_map[number] =  counter + 1
         } else {
             hash_map[number] =  1
         }
     }
     print(hash_map)
 }

 printNumberFrequency(inputNumbers: [1,1,2,2,2,2,2,4,5,6,8,8])



//Question 2. Print Characters And Their Frequencies In Order Of Occurrence.
let inputString = "ababbc"
func printCharacterFrequency(inputString : String) {
    var hash_map = Dictionary<Character, Int>()
    for ch in inputString {
        if let counter = hash_map[ch] {
            hash_map[ch] =  counter + 1
        } else {
            hash_map[ch] =  1
        }
    }
    print(hash_map)
}
printCharacterFrequency(inputString: inputString)
