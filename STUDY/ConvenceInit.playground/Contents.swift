import UIKit

// Convenience init: -
// to pass the default values or if you want to create a custom initializer
// every convenience init calls to it's designated initializer , after you call the designated init, then you are able to change properties inside the convenience init.

//Note : Convenience init is not available with value types.

class ABC {
    var x : Int?
    init(value : Int) {
        self.x = value
    }
    convenience init(customValue : Int){
        self.init(value : customValue)
    }
    convenience init(){
        self.init(value : 20)
    }
    convenience init(myValue : Int){
         self.init(value : 20)
        x = myValue
    }
}
let obj1 = ABC(value: 20)
let obj2 = ABC()
let obj3 = ABC(customValue: 20)
obj1.x //20
obj2.x // 20
obj3.x // 20

let obj = ABC(myValue: 30)
dump(obj)
