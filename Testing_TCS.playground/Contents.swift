import UIKit


//protocol Storage {
//    func savedata()
//    func aOptionalfunction()
//}
//extension Storage {
//    func aOptionalfunction() {
//      // optional function
//        print("Hey !! call me ")
//    }
//}
/*


let elements = ["A", "B", nil, "C", nil]

elements.compactMap { $0 }

*/

var a = 5

var b = 10

( b, a) = (a,b)

print(a)
print(b)

class DBHandler{
     static let shared = DBHandler()
     private init (){}
}

DBHandler.shared // access

//B A C
