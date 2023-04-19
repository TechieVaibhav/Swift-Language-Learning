import UIKit

/*
let dict = ["Ram": 150.00, "Geetha": 62.50, "Karim": 79.80, "Joe": 102.00, "Bob": 94.20]

print(dict.compactMap{$0.value}.reduce(0, +))

 */


// 2 input strings
// ABCD, BACD,
// BAC not anagram


func checkStringAnagram(string: String, anotherString : String) -> Bool{
 // lenght and character
    
    var firstCharacterArr = [Character]()
    var secondCharacterArr = [Character]()
    for ch in string{
        firstCharacterArr.append(ch)
        
    }
    for ch in anotherString{
        secondCharacterArr.append(ch)
    }
    
    if firstCharacterArr.count == secondCharacterArr.count {
        // look forward
        var leftPointer = firstCharacterArr.first
        
        for i in 0..<firstCharacterArr.count {
            for j in 0..<secondCharacterArr.count {
                if firstCharacterArr[i] == secondCharacterArr[j] {
                }
            }
            
        }
    } else {
        return false
    }
    return false
}





