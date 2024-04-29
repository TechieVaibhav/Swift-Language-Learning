import UIKit

func removeDuplicateLetters(_ inputString: String) -> String {
    var charCount: [Character: Int] = [:]
    for char in inputString {
        charCount[char, default: 0] += 1
    }

    var result = ""
    for char in inputString {
        if charCount[char] == 1 {
            result.append(char)
        }
    }

    return result
}

let input = "programming"
let output = removeDuplicateLetters(input)
print(output) // Output: "poain"
