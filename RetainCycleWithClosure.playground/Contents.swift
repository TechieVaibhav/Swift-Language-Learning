import UIKit
import CoreGraphics

/************ Retain Cycle with closure *****************/
/*
class Employee {
    
    var name : String = "MacBook"
    
    var systemName : (()-> Void)?
    
    init(){
        systemName = {
            print("name is \(self.name)")
        }
    }
    
    deinit {
        print("Hey!! Deinit is called")
    }
}

var employee : Employee? = Employee()
employee?.systemName?()
employee = nil

*/
/************ Solution for "Retain Cycle with closure" *****************/
/*
class Employee {
    
    var name : String = "MacBook"
    
    var systemName : (()-> Void)?
    
    init(){
        systemName = { [weak self] in
            print("name is \(self?.name ?? "")")
        }
    }
    
    deinit {
        print("Hey!! Deinit is called")
    }
}

var employee : Employee? = Employee()
employee?.systemName?()
employee = nil
*/


class A {
    var b: B? = nil
    var closure: (() -> Void)?
    init() {
        closure = {
            print(self.b ?? "")
        }
    }
    deinit {
        print("Hey !! deinit \(Self.self) calling..")
    }
}

class B {
    weak var a: A?
    deinit {
        print("Hey !! deinit \(Self.self) calling..")
    }
}

var a : A? = A()
var b : B? = B()
a?.b = b
b?.a = a

a = nil
b = nil

