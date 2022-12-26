import UIKit


var variable1 : Int
var variable2 : String

let whitespace = NSCharacterSet.whitespaces

let phrase =  ""

//Summary

//Returns a new string made by removing from both ends of the String characters contained in a given character set.
let trimmedString = phrase.trimmingCharacters(in: .whitespaces)
if trimmedString.contains(" ") {
    let new = trimmedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    print("whitespace  found : \(String(describing: new))")
    if let new = new, new.contains(" ") {
        print("new  found with space")
    } else {
        print("new  found not with space")
    }
} else {
    print("whitespace not found else ")
}
