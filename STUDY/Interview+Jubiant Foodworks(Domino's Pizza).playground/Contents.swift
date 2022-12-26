import UIKit

//Question1: Search Substing:
//Use This Extension Just TO Subscript
//@available (macOS 10.15, * )
//extension String {
//    subscript(idx: Int) -> String {
//        String(self[index(startIndex, offsetBy: idx)])
//    }
//}
//
//func isSubStringPartOfString(mainString : String, subString : String)->Int{
//    let sub = subString.count
//    let main = mainString.count
//
//    for index in 0..<main{
//        var jIndex: Int = 0
//        /* For current index, check for
//         // pattern match */
//        for kIndex in 0..<sub {
//            if mainString[(index + kIndex)] != subString[kIndex] {
//                break
//            }
//
//            jIndex = kIndex
//        }
//        if ((jIndex + 1) == sub) {
//            return index
//        }
//    }
//    return -1;
//}
//
//let result = isSubStringPartOfString(mainString: "I love cheese burst pizza", subString: "curst")
//if (result == -1) {
//    print("no")
//}
//else {
//    print("yes")
//
//}
//
//
//
////Question2: Protocols:
//
//protocol Edible {
//    func eat()
//}
//
//class Apple: Edible {
//    func eat()
//    {
//        print("Omnomnom! Eating the apple...")
//    }
//}
//
//class Person {
//    var name:String = ""
//
//    func provideSnack(withItem item: Apple)
//    {
//        item.eat()
//    }
//}
//
//let apple = Apple()
//let bob = Person()
//
//bob.name = "Bob"
//bob.provideSnack(withItem: apple)

extension String {
    
    func toEncodeURL() -> String {
        if !self.isEmpty{
            //Returns a new string made by removing from both ends of the String characters contained in a given character set.
            let trimmedString = self.trimmingCharacters(in: .whitespaces)
            print(trimmedString)
                guard let finalUrl = trimmedString.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {
                    return self
                }
               return finalUrl
            }
        return self
    }
}


let result4 = " gjSsZqRZrSmy6WeSKY+y/A== ".toEncodeURL()
print(result4)
