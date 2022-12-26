import UIKit

//Accessing and Modifying a String

var str = "Hello, playgroundp"


/*
 Use the startIndex property to access the position of the first Character of a String.
 The endIndex property is the position after the last character in a String.
 As a result, the endIndex property isn’t a valid argument to a string’s subscript.
 
 If a String is empty, startIndex and endIndex are equal.
 
 You access the indices before and after a given index using the index(before:) and index(after:) methods of String.
 
 To access an index farther away from the given index, you can use the index(_:offsetBy:) method instead of calling one of these methods multiple times.
 
 */

str[str.startIndex]

let index = str.index(before: str.endIndex)
print(str[index])


let afterIndex = str.index(after: str.startIndex)
print(str[afterIndex])

//

let offsetByStrt = str.index(str.startIndex, offsetBy: 4)
print(str[offsetByStrt])


let offsetByEndIndex = str.index(str.endIndex, offsetBy: -4)
print(str[offsetByEndIndex])


//Access characters
for indices in str.indices {
    print(str[indices], separator: "", terminator: " ")
}

//Inserting and Removing
//To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.

//Insert
var welcome = "hello"

welcome.insert("d", at: welcome.endIndex)
print(welcome, separator: "", terminator: "\n")
welcome.insert(contentsOf: "System", at: welcome.endIndex)
print(welcome, separator: "", terminator: "\n")

// Delete

//welcome.remove(at: welcome.startIndex)
//print(welcome, separator: "", terminator: "\n")
//
//welcome.remove(at: welcome.index(welcome.startIndex, offsetBy: 3))
//print(welcome, separator: "", terminator: "\n")

/*
 let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
 welcome.removeSubrange(range)
 print(welcome, separator: "", terminator:  "\n") */

let attachmentURL = "http://mobileapp.gloworld.com//GlobacomPic/content-drop/pushimages/593_gfdxsxcfyvfx.png"
if let url = URL(string: attachmentURL) {
    if (try? Data(contentsOf: url)) != nil {
        print("imageData available")
    } else {
        print("imageData not making")
    }
} else {
    print("url not making")
}

