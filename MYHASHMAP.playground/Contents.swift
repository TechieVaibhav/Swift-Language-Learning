import UIKit
import Foundation
/*
class MyCustomHashMap{
    var map : Array<Int>
    let size = 1000000
    
   init(){
        map = Array(repeating: -1, count: size)
    }
    
    // Complexity O(1)
    public func put(key : Int, value : Int){
        map[key] = value
    }
    
    // Complexity O(1)
    public func get(key : Int) -> Int{
        return  map[key]
    }
    // Complexity O(1)
    public func remove(key : Int){
        map[key] = -1
    }
    
    //Note : we know the array index , so we can directly access the value by O(1).
    
}
*/
class HashNode{
    var key : Int
    var value : Int
    var next : HashNode?
    
   init(key : Int, value : Int){
       self.key = key
       self.value = value
    }
}

class MyCustomHashMap{
    var map : Array<HashNode?>
    let size = 10000
    
    init(){
        map = Array(repeating: nil, count: size)
    }
    
    func hashIndex(key : Int)->Int{
        return key%size
    }
    
    // Complexity O(1)
    public func put(key : Int, value : Int){
        let hashIndexValue = hashIndex(key: key)
        guard let rootNode : HashNode = map[hashIndexValue] else {
            // new key, i.e., new node
            map[hashIndexValue] = HashNode(key: key, value: value)
            return
        }
        
        var currentNode : HashNode? = rootNode
        
        while currentNode != nil{
            if currentNode?.key == key{
                currentNode?.value = value
                return
            }
            if currentNode == nil{
                break
            }
            currentNode = currentNode?.next
        }
        currentNode?.next = HashNode(key: key, value: value)
    }
    
    // Complexity O(1)
    public func get(key : Int) -> Int{
        let hashIndexValue = hashIndex(key: key)
        guard let rootNode : HashNode =  map[hashIndexValue] else {
            return -1
        }
        var currentNode : HashNode? = rootNode
        while currentNode != nil {
            if currentNode?.key == key {
                return currentNode?.value ?? -1
            }
            currentNode = currentNode?.next
        }
        return -1
    }
    // Complexity O(1)
    public func remove(key : Int){
        let hashIndexValue = hashIndex(key: key)
        guard let rootNode : HashNode =  map[hashIndexValue] else {
            return
        }
        var currentNode : HashNode? = rootNode
        
        if currentNode?.key == key{
            map[hashIndexValue] = currentNode?.next
            return
        }
        while currentNode != nil {
            if currentNode?.key == key {
                currentNode?.next = currentNode?.next?.next
                return
            }
            currentNode = currentNode?.next
        }
    }
}

let obj = MyCustomHashMap()
print(obj.get(key: 123))
obj.put(key: 123, value: 190)
print(obj.get(key: 123))
obj.put(key: 123, value: 191)
obj.put(key: 123, value: 192)
obj.put(key: 123, value: 193)
print(obj.get(key: 123))
obj.remove(key: 123)
print(obj.get(key: 123))

obj.remove(key: 187)
