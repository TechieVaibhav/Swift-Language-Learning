import UIKit

var aString = "Hello, world"

var aChar: Character = "s"

//startIndex is a subscripts first valid argument
print(aString[aString.index(after: aString.startIndex)])

//endIndex is greater than one from subscripts last valid argument.
print(aString[aString.index(before: aString.endIndex)])

var multilineString = """
 A multiline strinmg is here...
       multiline with space
 A multiline strinmg is here... \n A multiline strinmg is here...
 A multiline strinmg is here...
 """
print(multilineString)



