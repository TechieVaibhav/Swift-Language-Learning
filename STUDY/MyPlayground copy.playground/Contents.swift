import UIKit


// str -- civic
// ci vi c

// cciiv

// aabb
//
//bbaa

// abba
// abba


//civic
//abba
//madam


func checkPermutaionIsPalindrom(input: String) -> Bool {
    var heap_map = [Character : Int]()
    for ch in input {
        if let counter = heap_map[ch] {
            heap_map[ch] = counter + 1
        } else {
            heap_map[ch] = 1
        }
    }
    var counter = 0
    for value in heap_map.values {
        if value % 2 != 0 {
            counter = counter + 1
        }
    }
    return (counter <= 1)
}


checkPermutaionIsPalindrom(input: "abba")

checkPermutaionIsPalindrom(input: "abbc")

//1->2->3->4->2->3->4

//1 2 3

//Aaabbcccdd -> A3b2c3d2

func findFrequency(input : String) {
    
    var counter : Int = 0
    var foundCh : Character? = input.first ?? nil
    print(foundCh ?? "")
    for ch  in input {
        if foundCh == ch {
            counter = counter + 1
        } else{
            print(counter)
            foundCh = ch
            print(foundCh!)
            counter = 1
        }
    }
    print(counter)
}

findFrequency(input: "aabbcccdd")
