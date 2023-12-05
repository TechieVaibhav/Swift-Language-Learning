import UIKit

/* Dependency Injection :- the way to inject the dependencies on run time.
how? -> so let suppose you have 3 classes- Class A, B, C. */

/* if class `A` is like a Networkmanager class that requires a url and end point to make a connection.
 */

class A{
    var objB = B()
    var objC = C()
}

class B{
    init(){}
    func getUrlAdress() -> String{
        return ""
    }

}

class C{
    init(){}
    func getUrlEndPath() -> String{
        return ""
    }
}

/*
Note : to build a network connection class A have dependencies with Class B & C.
class A --> url dependency--> class B
class A --> end point dependencies --> class C

so in class B and class C, any change occures in construtor, then it might be impact on class A, then it will break the SingleResponsibility principle.

 SingleResponsibility principle - A class should have only one reason to change. in above example, class A is change due to changes occures in B/C so it directly break the Single Resposibility principle.

 */

/* How will handle this senerio with Dependency Injection Way-

 1. class A ask the DI to provide the dependencies.
 2. DI will provide the dependencies like -
  var objB = B()
  var objC = C()
just by creating B&C objects, pass these objects to class A independently.
so now if any changes occuried in B/C constructor, then it will never impact on class A.

 */


//Ways to inject the dependencies ->
//1. Constructor injection way-
/*
class A{
    var objB : B
    var objC : C
    init(objB: B, objC: C) {
        self.objB = objB
        self.objC = objC
    }
}
 */

//2. Property injection way-
/*
class A{
    var objB : B?
    var objC : C?
}
var objB = B()
var objC = C()
var objA = A()

objA.objB = objB
objA.objC = objC
*/

//3. Method injection way-
/*
 class A{
     var objB : B?
     var objC : C?

     func passdependencies(objB : B, objc : C) {
         self.objB = objB
         self.objC = objc
     }
 }
*/


// example 2: You have Car class, which holding another class objects like Wheels and PetrolEngine.
class Car {
    var engine : PetrolEngine?
    var wheel : Wheels?
}

class PetrolEngine {

}
class Wheels {

}
// Now car holding the engine and wheel objects , there is a new requiremnt generated like petrolEngine should replace with cngEngine too (both capability), so in above code we have to change the car class, if PetrolEngine constructor change, this will impact the singleResponsibilty principle.
// Solution : Ask the DI to pass the external dependencies on run time.

//challanges without DI implementaion -> Car class is not testable independtly, because it has dependencies with PetrolEngine & Wheels classes. Code is not extensable, because PetrolEngine dependency is hardcoded, in future if any new engine lanuched,then we can not use it, we have to change the car class.Single Responsiblity is break.



