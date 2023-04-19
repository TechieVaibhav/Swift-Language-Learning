import UIKit


// associatedtype is used when we want to write a Genric Protocol.
// Note : when we adopt the protocol then associatedtype comes a `typealias` into the adopting class/struct.

protocol Queue {
    associatedtype T
    
    mutating func addItem(item : T)
    func count() -> Int
    subscript (i : Int) -> T {
        get
    }
}

struct MyIntQueue : Queue{
    subscript(i: Int) -> Int {
        return itemArray[i]
    }
    
    
    typealias T = Int
    
    var itemArray : [Int] = [Int]()
    
    mutating func addItem(item: Int) {
        itemArray.append(item)
    }
    
    func count() -> Int {
        return itemArray.count
    }
}

var myIntQueue = MyIntQueue()

myIntQueue.addItem(item: 2)
myIntQueue.addItem(item: 4)
myIntQueue.count()


struct MyFlotQueue : Queue{
    
    
    
    typealias T = Float
    
    var itemArray : [T] = [T]()
    
    mutating func addItem(item: Float) {
        itemArray.append(item)
    }
    
    func count() -> Int {
        return itemArray.count
    }
    subscript(i: Int) -> Float {
        return itemArray[i]
    }
    
}

var myFlotQueue = MyFlotQueue()

myFlotQueue.addItem(item: 2.4)
myFlotQueue.addItem(item: 4.5)
myFlotQueue.count()
myFlotQueue[0]
