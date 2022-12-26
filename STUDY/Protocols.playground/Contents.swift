import UIKit

//Protocols : enforce code decipline

// when we need to use : ->> when the basic functionality is repeted, like we want to create a car, so every car has some basic functionality like start(), stop(), hornsound(), so we can design multiple car like audi, bmw, alto, but all car have some basic functionality, to folow code dicipline , we can create protocols.

/******************************************************************************/
/*
protocol Car {
    func start()
    func stop()
    func hornSound()
}

// Design a BMW
class BMW : Car {
    func start() {
        print("BMW is start")
    }
    
    func stop() {
        print("BMW stop")

    }
    
    func hornSound() {
        print("BMW hornSound")
    }
    
}

let bmw = BMW()
bmw.start()
bmw.hornSound()
bmw.stop()

// Design a Alto
class Alto : Car {
    func start() {
        print("Alto is start")
    }
    
    func stop() {
        print("Alto stop")

    }
    
    func hornSound() {
        print("Alto hornSound")
    }
}

let alto = Alto()
alto.start()
alto.hornSound()
alto.stop()

//Now we want to design a super Car which has more power
//another interface for a super car
protocol SupeeEngine {
    func powerFullEngin()
    func diskBreak()
}

// Design a Supercar
class SuperCar : Car, SupeeEngine {
    func powerFullEngin() {
        print("power in engin")
    }
    
    func diskBreak() {
        print("disk Break")
    }
    
    func start() {
        print("SuperCar is start")
    }
    
    func stop() {
        print("SuperCar stop")

    }
    
    func hornSound() {
        print("SuperCar hornSound")
    }
}

let superCar = SuperCar()

superCar.powerFullEngin()
superCar.start()
superCar.diskBreak()
superCar.stop()
*/
/******************************************************************************/

/******************************************************************************/
/*
// If we add a init func inside protocols
protocol MyProtocol {
    init()
}

class A : MyProtocol{
    var x : Int = 0
    required init() {
        print("init calling...")
    }
}

let obja = A()
obja.x = 20
print(obja.x)
*/
/******************************************************************************/
/******************************************************************************/
/*
// If we add a falable init func inside protocols
protocol ProtocolWithFalableInit {
 
    init?(value : Int)
}

class ClassWithFalableInitProtocol : ProtocolWithFalableInit{
    required init?(value: Int) {
        guard 100...200 ~= value else { return nil }
        self.xyz = value
    }
    var xyz: Int
}

let classWithFalableInitProtocol = ClassWithFalableInitProtocol(value: 100)
print(classWithFalableInitProtocol?.xyz ?? "" ) //100
classWithFalableInitProtocol?.xyz = 20
print(classWithFalableInitProtocol?.xyz ?? "" ) // 20


class SuperClass : ProtocolWithFalableInit{
    required init?(value: Int) {
        guard 100...200 ~= value else { return nil }
        self.xyz = value
    }
    var xyz: Int
}
class Child: SuperClass {
    required init?(value: Int) {
        super.init(value: value)
    }
}

let child = Child(value: 100)
print(child?.xyz ?? "" ) //100
child?.xyz = 20
print(child?.xyz ?? "" ) // 20


class AnotherSuperClass{
    var xyz: Int
     init?(value: Int) {
        self.xyz = value
    }
   
}
class AnotherChild: AnotherSuperClass, ProtocolWithFalableInit {
    required override init?(value: Int) {
        super.init(value: value)
    }
}
*/

/******************************************************************************/

/******************************************************************************/
/*
// If we add a init func inside protocols
protocol MyProtocolWithComuptedProperties {
    var xyz : Int { get set }
    
}

class ComuptedProperties : MyProtocolWithComuptedProperties{
    var xyz: Int
    init(xyz : Int) {
        self.xyz = xyz
    }
   
}

let comuptedProperties = ComuptedProperties(xyz: 100)
comuptedProperties.xyz = 20
print(comuptedProperties.xyz )
*/
/******************************************************************************/

/******************************************************************************/
//Protocols With Optional Methods
/*
@objc protocol MyCustomOptionalProtocol {
    func doSomeRequiredWork()
    @objc optional func doSomePptionalWork()
}

class TestOptionalProtocol : MyCustomOptionalProtocol {
    func doSomeRequiredWork() {
        print("doSomeRequiredWork")
    }
}
 let testObj = TestOptionalProtocol()
testObj.doSomeRequiredWork()
testObj.doSomePptionalWork?()// if you try to call optional function which is not a part of implementaion, code will crash
*/
/******************************************************************************/
/******************************************************************************/
//Protocols With Optional Methods via Extension
/*
 protocol MyOptionalProtocol {
    func doSomeRequiredWork()
}

extension MyOptionalProtocol {
    func doSomeOptionalWork(){
        print("doSomeOptionalWork")
    }
}
class TestOptionalProtocolWithExtension : MyOptionalProtocol {
    func doSomeRequiredWork() {
        print("doSomeRequiredWork")
    }
}
 let tstOptionalProtocolWithExtension = TestOptionalProtocolWithExtension()
tstOptionalProtocolWithExtension.doSomeRequiredWork()
tstOptionalProtocolWithExtension.doSomeOptionalWork()// if you declare optional functions with extension , then your code will run perfactly
 */
/******************************************************************************/

/******************************************************************************/
//Protocols For a Specific Type
/*
protocol IntProtocol {
   func toString()
}

//extension IntProtocol where Self == Int {}
extension IntProtocol where Self == String {}

extension String : IntProtocol {
    func toString() {
        print("calling...")
    }
    
    
}
 

"123".toString()




protocol MyView: UIView { /*...*/ }
extension MyView where Self: UIView { /*...*/ }
/*
class CustomView : MyView { //'MyView' requires that 'CustomView' inherit from 'UIView'
    
}
 */
class SolutionCustomView : UIView,MyView { //'MyView' requires that 'CustomView' inherit from 'UIView'
    
}
*/
/******************************************************************************/

//add 2 number a using a protocols

protocol NumbericType{
   static func +(left : Self, right : Self ) -> Self
    static func *(left : Self, right : Self ) -> Self
    static func /(left : Self, right : Self ) -> Self
    static func %(left : Self, right : Self ) -> Self
}

//extension NumbericType where Self == Int {}
extension Int : NumbericType {}

func addTwoNumber<T : NumbericType>(numberOne : T, numberTwo: T) {
    print(numberOne + numberTwo)
}

func multiplyTwoNumber<T : NumbericType>(numberOne : T, numberTwo: T) {
    print(numberOne * numberTwo)
}
func modTwoNumber<T : NumbericType>(numberOne : T, numberTwo: T) {
    print(numberOne % numberTwo)
}

addTwoNumber(numberOne: 10, numberTwo: 10)
multiplyTwoNumber(numberOne: 6, numberTwo: 6)
modTwoNumber(numberOne: 6, numberTwo: 6)



func sum<T: Numeric>(numberOne : T, numberTwo: T) {
    print(numberOne + numberTwo)
}
sum(numberOne: 80.90, numberTwo: 80.90)
