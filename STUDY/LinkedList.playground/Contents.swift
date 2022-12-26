import UIKit




// collection --- Nodes
class Node {
    var value : Int
    var nextNode: Node?
    init(value : Int, newNode: Node?) {
        self.value = value
        self.nextNode = newNode
    }
}
/*
//Create First Node
let firstNode = Node(value: 10, newNode: nil)
//Create Second Node
let secondNode = Node(value: 20, newNode: nil)
dump(firstNode)
//Now Connect 2 Nodes
firstNode.nextNode = secondNode

//Create third Node
let thirdNode = Node(value: 30, newNode: nil)
secondNode.nextNode = thirdNode
dump(firstNode)

*/
class LinkedList{
     var node : Node?
    
    func printAllNodes(headNode : Node?) {
        var currentNode: Node? = headNode
        while currentNode != nil {
            print(currentNode?.value ?? 0)
            currentNode = currentNode?.nextNode
        }
    }
    func insertNewNode( previousNode : Node?, newValue: Int) {
        if previousNode == nil {
            return
        }
        let newNode = Node(value: newValue, newNode: previousNode?.nextNode)
        previousNode?.nextNode = newNode
    }
    //1->2->3->4->nil
    //1-> nil  2->3->4->nil
    //2->1-> nil
    //4->3->2->1->nil
    func reversedLinkedList(headNode : Node?) -> Node? {
        var currentNode = headNode
        var previous : Node?
        var next : Node?
        while currentNode != nil {
            next = currentNode?.nextNode
            currentNode?.nextNode = previous
            previous = currentNode
            currentNode = next
        }
        return previous
    }
    
    func lenghtOfLinkedList(headNode : Node?) -> Int {
        var currentNode = headNode
        var counter = 0
        while currentNode != nil {
            print("currentNode : ---> \(String(describing: currentNode?.value))")
            counter = counter + 1
            currentNode = currentNode?.nextNode
        }
        return counter
    }
    
    func getMiddleNode(headNode: Node?) -> Node? {
        let length = lenghtOfLinkedList(headNode: headNode)
        var mid = length/2
        var currentNode = headNode
        while  mid > 0 && currentNode != nil {
            currentNode = currentNode?.nextNode
            mid = mid - 1
        }
        return currentNode
    }
  //for sorted linked list
    func removeDuplicateNodes2(headNode : Node?) {
        var currentNode = headNode
        var nextNode : Node?
        while currentNode != nil {

            if currentNode?.value == currentNode?.nextNode?.value {
                nextNode = currentNode?.nextNode?.nextNode
                currentNode?.nextNode = nextNode
            } else {
                currentNode = currentNode?.nextNode
            }
        }
    }
    //for UnSorted linked list
    func removeDuplicateNodesFromUnSorted(headNode : Node?) {
        var currentNode = headNode
        var previousNode : Node?
        var hash_map = [Int : Int]()
        
        while currentNode != nil {
            if let value = currentNode?.value , let _ = hash_map[value] {
                previousNode?.nextNode = currentNode?.nextNode
            } else {
                let value = currentNode?.value ?? 0
                hash_map[value] = 0
                previousNode = currentNode
            }
            currentNode = currentNode?.nextNode
        }
    }
  
    func sortTheLinkedList(headNode : Node?)  {
        var currentNode = headNode
        var temp : Int = 0
        var next : Node?
        
        while currentNode?.nextNode != nil {
            next = currentNode?.nextNode
            while  next != nil {
                if (currentNode?.value ?? 0) > (next?.value ?? 0) {
                    temp = next?.value ?? 0
                    next?.value = currentNode?.value ?? 0
                    currentNode?.value = temp
                }
                next = next?.nextNode
            }
            currentNode = currentNode?.nextNode
        }
    }
    
    func merge2LinkedList(headNodeL1 : Node?, headNodeL2 : Node?) -> Node?{
        var currentNodeL1 = headNodeL1
        var currentNodeL2 = headNodeL2
        //to merge list, we need to make a extra dummy node
        let newDummyNodeL3holder: Node? = Node(value: -1, newNode: nil)
        var newDummyNodeL3: Node? = newDummyNodeL3holder
        
        while currentNodeL1 != nil && currentNodeL2 != nil {
            if (currentNodeL1?.value ?? 0) > (currentNodeL2?.value ?? 0) {
                newDummyNodeL3?.nextNode = currentNodeL2
                currentNodeL2 = currentNodeL2?.nextNode
            } else {
                newDummyNodeL3?.nextNode = currentNodeL1
                currentNodeL1 = currentNodeL1?.nextNode
            }
            newDummyNodeL3 = newDummyNodeL3?.nextNode
        }
        newDummyNodeL3?.nextNode = currentNodeL1 ?? currentNodeL2
        return newDummyNodeL3holder
    }
}
let linkedList = LinkedList()
////Create First Node
//linkedList.node = Node(value: 1, newNode: nil)
////create a new node
//let newNode = Node(value: 2, newNode: nil)
//linkedList.node?.nextNode = newNode
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 3)
//
//linkedList.printAllNodes(headNode: linkedList.node)
//print("", separator: "", terminator: "\n")
//let reversed = linkedList.reversedLinkedList(headNode: linkedList.node)
//dump(reversed)
//linkedList.printAllNodes(headNode: reversed)

//let lenght = linkedList.lenghtOfLinkedList(headNode: linkedList.node)
//linkedList.getMiddleNode(headNode: linkedList.node)?.value
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 3)
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 2)
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 9)
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 5)
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 1)
//linkedList.insertNewNode(previousNode: linkedList.node, newValue: 3)
//linkedList.insertNewNode(previousNode: linkedList.node?.nextNode, newValue: 3)
//linkedList.printAllNodes(headNode: linkedList.node)
//print("", separator: "", terminator: "\n")
//linkedList.removeDuplicateNodes2(headNode: linkedList.node)
//linkedList.printAllNodes(headNode: linkedList.node)
//print("", separator: "", terminator: "\n")
//linkedList.removeDuplicateNodesFromUnSorted(headNode:  linkedList.node)
//linkedList.printAllNodes(headNode: linkedList.node)
//print("", separator: "", terminator: "\n")

//linkedList.sortTheLinkedList(headNode: linkedList.node)
//linkedList.printAllNodes(headNode: linkedList.node)


let firstNode = Node(value: 1, newNode: nil)
//Create Second Node
let secondNode = Node(value: 2, newNode: nil)
//Now Connect 2 Nodes
firstNode.nextNode = secondNode

//Create third Node
let thirdNode = Node(value: 3, newNode: nil)
secondNode.nextNode = thirdNode

let fourthNode = Node(value: 4, newNode: nil)
//Create Second Node
let fifthNode = Node(value: 5, newNode: nil)
fourthNode.nextNode = fifthNode

//Create third Node
let sixNode = Node(value: 6, newNode: nil)
fifthNode.nextNode = sixNode
linkedList.printAllNodes(headNode: firstNode)
print("", separator: "", terminator: "\n")
linkedList.printAllNodes(headNode: fourthNode)
print("", separator: "", terminator: "\n")

let result = linkedList.merge2LinkedList(headNodeL1: firstNode, headNodeL2: fourthNode)
linkedList.printAllNodes(headNode: result)



/*
var dummy = Node(value: 1, newNode: nil)
var dummy2 : Node?  = dummy

dummy2?.nextNode = Node(value: 2, newNode: nil)
dummy2 = dummy2?.nextNode

dummy2?.nextNode = Node(value: 3, newNode: nil)
dummy2 = dummy2?.nextNode
print("", separator: "", terminator: "\n")
dump(dummy)
*/
