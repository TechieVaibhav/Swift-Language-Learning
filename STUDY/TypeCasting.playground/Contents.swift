import UIKit
//Type Casting :- there 2 ways :
/*
1. Upper Casting -- as opertor used for upper casting.
2. Downcasting --- as? , as! opertor are used for down casting.
*/

/********************************************************************************/
//Upper Casting
// Child ----> Parent mapping
//child object ko parent obj me type cast krte hai
/*
//Example 1:
class Parent{
    func isParent() { print(" Yes i am parent ") }
}
class Child: Parent {
    func isChild() { print(" Yes i am child ") }
}

let childObj = Child() as Parent
childObj.isParent()//Yes i am parent

//Example 2:
//here becasue Uiview is a parent class for UILable, so for up casting we can can access only parent class functionality
 let view = UILabel() as UIView
*/
/********************************************************************************/


/********************************************************************************/
//Downcasting Casting
// Parent ----> child mapping
//parent object ko child obj me type cast krte hai

//Example 1:
//array of Any
//Any is a base/parent to all of swift members

let arrayOfAny : [Any] = [ 190, "string", 90.80]

for objType in arrayOfAny {
    if let value = objType as? Int {
        print(value)
    }
    if let value = objType as? Double {
        print(value)
    }
    if let value = objType as? String {
        print(value)
    }
}


//Example 2:
protocol God {
    func power()
}
class Krishna : God {
    func power() {
        print("They controll things by their wheel")
    }
}
class RamJI : God {
    func power() {
        print("They controll things by their pation")
    }
}

let allGods : [God] = [Krishna(), RamJI()]

for  god in allGods {
    if let krishna = god as? Krishna {
        krishna.power()
    }
    if let ramJI = god as? RamJI {
        ramJI.power()
    }
}

//Example 3:
class VC : UIViewController {
    
}
let storyBord = UIStoryboard(name: "main", bundle: nil)
//instantiateViewController method returns --> UIViewController, so to initalize the VC we need to perform `DownCasting` .
let vc = storyBord.instantiateViewController(identifier: "VC") as? VC

/********************************************************************************/
