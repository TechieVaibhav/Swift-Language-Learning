import UIKit

// ************** String and Characters **************
//Note In String : Direct subscript not posible with strings
var str: String = "Hello world" // a collection of characters and str is a collection type.
var character : Character = "a" // a character is a single letter.

// startindex vs endindex - subscript to string
// startindex - position of the first character.
print( str[str.startIndex]) //H
print( str[str.index(after: str.startIndex)]) //e

// endIndex - more than 1 of it's last character position.

print(str[str.index(before: str.endIndex)]) //d

var multipline = """
This is a paragrapgh
how old are you\ni am just 18\nokay
"""
print(multipline)
/*
This is a paragrapgh
how old are you
i am just 18
okay
 */



