import UIKit

class A {
  static let shared = A()
    private init (){}
}


//let data = ["john": 23, "james": 24, "vincent": 34, "louis": 29]
//
//let result:[String] = data.sorted { $0, $1   in
//    return $0. > $1
//}.map { (allkey, allValue) -> T in
//    return allValue
//}

let s = [1,2,1]

func doSomething(closure : ()->Void) {
    
}

func addNumbers<T>(a: T, b: T) -> T{
    return a + b
}
let resulte : Int = addNumbersInt(a: 10, b: 10)


protocol MyProtocol : UIView{
    associatedtype Item
   optional func doSomeWork()
}
//Dynamic Collable

class Person {
  var firstName: String
  var lastName: String
  
  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}
var person1 = Person(firstName: "Neel", lastName: "Bakshi")
var person2 = person1 // person2 is created a a new object since this follows Copy-on-Assignment behavior
// For special cases like Array, Dictionary, Set etc. that have generics associated with them which can be reference types, Copy-on-Write is used**
var array = ["neel", "bakshi"]
var array2 = array // array2 still points to the same array object
array2.append("rando") // this is when a new array2 is created and a value is appended to it.
