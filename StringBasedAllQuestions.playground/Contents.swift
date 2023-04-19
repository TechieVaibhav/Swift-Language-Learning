import UIKit

var greeting = "Hello, playground"
/****************************************/

/* String is a collection of Character */

// Challange : String : subscript can not be apply directly over the `String`.

//looping :
//1. half Range : a..>b (start from a till b but b are not consider) , like 1..<3 so 1,2 loop runs 2 times
//2. closed Range : a...b (a and b both are consider) , like 1...3 so 1,2,3 loop runs 3 times

/****************************************/


/****************************************/

let givenString = "ABCDFE"

func reverseTheStringByReverseLoop(givenStr : String) {
    var result = ""
    
    for char in givenStr{
        result = String(char) + result
    }
    print("\(result)")
}

reverseTheStringByReverseLoop(givenStr: givenString)



/****************************************/






