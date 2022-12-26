import UIKit

func findDuplicateItems(inputArray : [Int]) {
    var hash_Map = [Int : Int]()
    for obj in inputArray {
        if let counter = hash_Map[obj] {
            hash_Map[obj] = counter + 1
        } else {
            hash_Map[obj] = 1 // 0(1).
        }
    }
    
    for (key, counter) in hash_Map.enumerated() {
        if counter.value > 1 {
            print("\(key) and \(counter) ")
        }
    }
}

findDuplicateItems(inputArray: [1,2,2,3,4])

func findKey(array : [Int], key : Int) {
    
    
}

let array = [["a", "e" ," x" ,"y" ,"z" ], ["c", "d","f", "g", "k" ], ["a", "e", "i", "o" ,"z"]]

for obj in
