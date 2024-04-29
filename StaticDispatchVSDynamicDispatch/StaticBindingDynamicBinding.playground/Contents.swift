import UIKit

//Binding - let suppose you have 2 classes,parent and child class, parent and child have same function/method, binding determines which method is executed by instance of parent or child.

class ParentClass{
    func order(){
        print("I am parent method")
    }
}
class ChildClass: ParentClass{
    override func order(){
        print("now i am move to child method")
    }
}

let parentObj = ParentClass()
parentObj.order()

let childClassObj = ChildClass()
childClassObj.order()
