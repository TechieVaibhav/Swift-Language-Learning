import UIKit

// Generics- Generics mean a reusable & smart approach, in generic function, we have to take a placeholder type like `T`, and `T` will infer when we calling the generic function.

func swapTwoNumber<T>(num1 : inout T, num2: inout T){
    var temp = num1
    num1 = num2
    num2 = temp
    print("swaped number are ->\(num1) & \(num2)")
}
var num1 = 10
var num2 = 20
swapTwoNumber(num1: &num1, num2: &num2) //swaped number are ->20 & 10//

func addition<T : Numeric>(num1 : inout T, num2: inout T){
    let result = num1 + num2
    print("addition are ->\(result)")
}

var addNum1 = 10
var addNum2 = 20
addition(num1: &addNum1, num2: &addNum2) // addition are ->30 //

func genericNumber<T,U>(num1 : inout T, num2: inout U){

    print("the numbers are ->\(num1) & \(num2)")
}

var genericNum1 = 10
var genericNum2 = 20.90
genericNumber(num1: &genericNum1, num2: &genericNum2) // the numbers are ->10 & 20.9 //

// A generic class
class MyGenericClass<T> {
    var value : T
    init(value: T) {
        self.value = value
    }
}
let genericClassObj = MyGenericClass<String>(value: "hey I am a generic class")
print(genericClassObj.value) // hey I am a generic class //

// A generic struct
struct MyGenericStruct<T>{
    var value : T
}
let genericStructObj =  MyGenericStruct<Int>(value: 10)
print(genericStructObj.value) // 10 //

// A generic protocol - to make a protocol generic, protocol have associatedtype.
// associatedtype convert into a typealias when we adopt the protocol.
protocol GenericProtocol{
    associatedtype T
    func count() -> Int
    mutating func additem(item : T)
}

struct GenericStructWithProtocol : GenericProtocol{

    typealias T = Int

    var items = [Int]()
    func count() -> Int {
        return items.count
    }
    mutating func additem(item: Int) {
        items.append(item)
    }
}

var genericStructWithProtocol = GenericStructWithProtocol()
genericStructWithProtocol.additem(item: 10)
genericStructWithProtocol.additem(item: 20)
print(genericStructWithProtocol.count()) // 2 //

class GenericClassWithProtocol : GenericProtocol{
    typealias T = String
    var items = [String]()

    func count() -> Int {
        return items.count
    }
    
    func additem(item: String) {
        items.append(item)
    }
}
let genericClassWithProtocol = GenericClassWithProtocol()
genericClassWithProtocol.additem(item: "Hello")
genericClassWithProtocol.additem(item: "World")
print(genericClassWithProtocol.count()) // 2 //

// Where clause with generics
// how to constrained(boundation/restriction) to protocol work with specific type only.

protocol MyIntProtocol{
    func getValue()
}
extension MyIntProtocol where Self == Int{

}

extension Int : MyIntProtocol{
    func getValue() {
        print("This is my calling over Int")
    }
}

90.getValue() // This is my calling over Int //

// View protocol

protocol ViewProtocol {
    func myView()
}

extension ViewProtocol where Self : UIView{

}

extension UIView : ViewProtocol{
    func myView() {
        print("my custom view")
    }
}
let lbl = UILabel()
lbl.myView() // my custom view //

let uiView = UIView()
uiView.myView() // my custom view //
