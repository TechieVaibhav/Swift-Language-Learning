import UIKit

//typealias used to rename for an existing Type
typealias myType = String

func printName(name :  myType) {
    print(name)
}
printName(name: "vaibhav sharma")

class Calcualtion {
    var amount: Int = 0
    init(value : Int) {
        self.amount = value
    }
}
typealias myCalculator = [Calcualtion]

func insertAllCalculation( enteredItem : myCalculator) {
    for obj in enteredItem {
        print(obj.amount)
    }
}
insertAllCalculation(enteredItem: [Calcualtion(value: 10), Calcualtion(value: 30)])

//typealias for tuples
 typealias myTuples  = (Int, Int)

func printItems(items : myTuples){
    print(items.0)
    print(items.1)
}
printItems(items: (10,40)) //10 40

// Type deifination for Dictionary
let dict : Dictionary<String, Int> = ["gg":  10, "hh": 90]
print(dict)//["hh": 90, "gg": 10]
let dict2 : [String: Int] = ["gg":  10, "hh": 90]
print(dict2)//["hh": 90, "gg": 10]

//optional

let string : String? = nil
let anotherString : Optional<String> = nil
print(string ?? "nil" ) //nil
print(anotherString ?? "nil") // nil

