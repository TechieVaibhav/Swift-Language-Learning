import UIKit

// Singleton Pattern
// single means only one instance
// In singleton design pattern, only one instance is created throught the app.

//Which type of information should be placed inside the singleton class?
// the information/data that should be accessable at global level, should be placed inside the singleton class.

class Singleton{
    static let shared = Singleton()
    private init(){}
}

// Private init ensure that you can not create the singleton class instance outside

//which type of methods/properties should place inisde singleton class?

// Rule : A private initializer should be made

class LocationManager{
    static let shared = LocationManager()
    private init(){}

    func checkLocationPermision() {
        print("location is granted")
    }
    static func chckRange(){
        print("Range checking...")
    }
}

LocationManager.shared.checkLocationPermision()


// Test singleton class refernce are same

class SingletonClass{
    static let shared = SingletonClass()
    private init(){

    }
    func businessLogic() {
        print("Logic about business")
    }
}
extension SingletonClass : Equatable{
    static func == (lhs: SingletonClass, rhs: SingletonClass) -> Bool {
        return lhs === rhs
    }


}

class SingletonTest{
    let singletonObj1 = SingletonClass.shared
    let singletonObj2 = SingletonClass.shared

    func test() {
        if singletonObj1 == singletonObj2 {
            print("both are same reference")
        } else {
            print("Differ")
        }
    }
}
SingletonTest().test()


//Question : What is the difference with class Singleton vs Struct Singleton?
// state management is dony by only class because all class shared references are points ton same memory location but in struct case, a shared reference creates a new memory location, so 2 copies are created but as per singleton concept, only one single instance should be created, so always create a singleton by class not do that by struct.

struct StructSingleton {

    static let shared = StructSingleton()
    var state = 0
    private init (){

    }
}
class ClassSingleton {

    static let shared = ClassSingleton()
    var state = 0
    private init (){

    }
}

// by struct
var structref = StructSingleton.shared
structref.state = 90
print("#> \(structref.state)") //#> 90
print("#> \(StructSingleton.shared.state)") //#> 0

// by class
var classRef = ClassSingleton.shared
classRef.state = 90
print("#> \(classRef.state)") //#> 90
print("#> \(ClassSingleton.shared.state)") //#> 90


// How To Make Singleton thread safe ?
// Race Condition Solution -
// Race Condition - at a same time read-write operation happened.
// collection type - array and dictionary are not thread safe by default, so if you are using read write opertion at a same time, then race condition is occured . look for a solution -
// this solution also considered as `Custom Google Analytics` solution ( event log (write) and event read operations).


/*
class NONThreadSafeSingleton {
    static let shared = NONThreadSafeSingleton()
    var dictionary = Dictionary<String, Any>()// [String , Any]()
    private init(){

    }

    func write(key : String, and value : Any) {
        dictionary[key] = value
        print("key \(key) and value \(value)")
    }
}

let nonThreadSafeSingleton = NONThreadSafeSingleton.shared
let queue = DispatchQueue(label: "my queue", attributes: .concurrent)
for i in 1...200{
    queue.async {
        nonThreadSafeSingleton.write(key: "\(i)", and: i) //error: Execution was interrupted
    }
}
*/

// Solution
class ThreadSafeSingleton {
    static let shared = ThreadSafeSingleton()
    var dictionary = Dictionary<String, Any>()// [String , Any]()
    // additional things
    var queue = DispatchQueue(label: "Queue handler", attributes: .concurrent)

    private init(){

    }

    func write(key : String, and value : Any) {
        queue.asyncAndWait(flags: .barrier, execute: {
            [weak self] in
               self?.dictionary[key] = value
               print("key \(key) and value \(value)")
        })
    }

    func readValue(for key : String) {
        // apply lock
        queue.asyncAndWait(flags: .barrier, execute: {
            [weak self] in
            print("key \(key) and value \(String(describing: self?.dictionary[key]))")
        })
    }
}

let threadSafeSingleton = ThreadSafeSingleton.shared
let queue = DispatchQueue(label: "my queue", attributes: .concurrent)
for i in 1...200{
    queue.async {
        threadSafeSingleton.write(key: "\(i)", and: i)
        threadSafeSingleton.readValue(for: "\(i)")//error: Execution was interrupted
    }
}

//dual core system ->
//Processor P1 -----> shared R (data read)
//
//Processor P2 -----> shared R ( data write)
//Processor P3 ----->shared R (data read) // as result value -- corrupted()




// Where we can use singleton?
// music player instance manager like - music.play/music.stop/
// others cases - Logging systems, Object caching, Resource access control, Configuration managers: Managing application settings, API keys, or database connections is ideal for singletons because you only need one instance to access configuration data throughout the application.

