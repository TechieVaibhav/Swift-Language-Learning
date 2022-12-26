import UIKit

//Queue
// queue is a list where where items are enqued at the last positioned and always dequed the first enqued item, first come, first served!.
// used queues always when you don't want to maintain the order of items, becasue always dequeue the first item.

//Note : stack is better vs queue, because enque takes O(1) time and O(n) time for dequeue operation, because first object is deleted , so all remaining objects are shiffted to left that take O(n) process. in stack push and pop operation takes O(1) time, it is constant time.

/****************************************************************/

/*
public struct Queue<T> {
    
    fileprivate var array :[T] = []
    
    mutating func enQueue(element : T){
        self.array.append(element)
    }
    mutating func deQueue(){
        self.array.removeFirst()
    }
     func isQueueEmpty() -> Bool{
        return array.isEmpty
    }
    func peek()->T? {
        return array.first
    }
}

var queue = Queue<Int>()
queue.enQueue(element: 10)
queue.enQueue(element: 20)
queue.enQueue(element: 30)

queue.deQueue()
queue.isQueueEmpty()
queue.peek()
*/
/****************************************************************/

protocol Queue {
    associatedtype T
  mutating  func enqueue(element : T)
    mutating func dequeue()
    func isQueueEmpty() -> Bool
    func peek() -> T?
}
public struct MyQueue : Queue {
    var  array : [T] = [T]()
    
    mutating func enqueue(element: Int) {
        array.append(element)
    }
    
    mutating  func dequeue() {
        array.removeFirst()
    }
    
    func isQueueEmpty() -> Bool {
        return array.isEmpty
    }
    
    func peek() -> Int? {
        return array.first
    }
    
    typealias T = Int
    
    
}

var myQueue = MyQueue()
myQueue.enqueue(element: 10)
myQueue.enqueue(element: 20)
myQueue.enqueue(element: 30)

myQueue.dequeue()
myQueue.isQueueEmpty()
myQueue.peek()
