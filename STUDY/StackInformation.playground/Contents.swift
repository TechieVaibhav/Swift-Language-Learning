import UIKit


//Stack -- LIFO based
//----> last in first out
//opertions: -- push and pop
// stack overflow -- stack is full
// stack underflow -- empty stack
// peek -- TopOFStack

//Note : Fun fact about stacks: Each time you call a function or a method, the CPU places the return address on a stack. When the function ends, the CPU uses that return address to jump back to the caller. That's why if you call too many functions -- for example in a recursive function that never ends -- you get a so-called "stack overflow" as the CPU stack has run out of space.


/*

public struct Stack <T> {
    fileprivate var array : [T] = []
     mutating func push(element : T)  {
        array.append(element)
    }
    mutating func pop()  {
        array.removeLast()
    }
    func empty() -> Bool  {
        return array.isEmpty
    }
    func peek()  -> T?{
        return array.last
    }
}

var stack = Stack<Int>()
stack.push(element: 10)
stack.push(element: 20)
stack.push(element: 30)
dump(stack)

stack.pop() // 30 pop
stack.empty() // false
stack.peek() // 20
dump(stack) //

 */

protocol Stack {
    associatedtype T
   mutating func push(element : T)
    mutating func pop()
    func empty() -> Bool
    func peek() -> T?
}

public struct MyStack : Stack {
    typealias T = Int
    private var array : [T] = []
    mutating func push(element: Int) {
        array.append(element)
    }
    mutating  func pop() {
        array.removeLast()
    }
    func empty() -> Bool {
        return array.isEmpty
    }
    func peek() -> Int? {
        return array.last
    }
}

var obj = MyStack()
obj.push(element: 10)
obj.push(element: 20)
obj.push(element: 30)

obj.pop()
obj.pop()

obj.peek()

obj.empty()
