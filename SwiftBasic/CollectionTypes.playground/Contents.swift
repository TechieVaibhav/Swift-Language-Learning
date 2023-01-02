import UIKit

//Array : array is a collection of similar data types and it can also contains duplicate items.

let arrayWithDuplicateItems = [1,2,3,4,1,2,3,3,4]

//define array with explicit type
var emptyArray : [Int] = []

var anotherEmpty = [Int]()

var anotherEmptyArray = Array<Int>()

emptyArray.append(10)

anotherEmpty.append(20)

anotherEmptyArray.append(30)

let mixarray = [1,32,4,5,56,"Hi There"] as [Any] //not a good approach


/***********************************************/

//Sets : unordered collection of unique elements.

let aSet = Set([1,2,3,4,31])
print(aSet)


//let aMixSet = Set([1,2,3,4,31, "Hi there"]) as Set([Any]) // not posible like Array, in set we can not take the `Any` adavntage to take mix elementes.

/***********************************************/
// Dictionary : unordered collection of key value pair data.

var dict = ["a" : 10, "b":20]
print(dict) //["b": 20, "a": 10]
for (aKey,aValue) in dict {
    print("\(aKey) and \(aValue)")
}

dict["a"] = nil
print(dict) // ["b": 20]

/**************************************************/

// Controll statement-
var a = 10

if a > 5 {
    print("older than 5")
} else if a > 3{
    print("older than 3")
} else {
    print("not older than 3")
}

for index in 0..<10{
    print("looping")
    if index > 2 {
        continue
    }
    print("your looping index : \(index)")
}

/*
//Outpiut :
looping
your looping index : 0
looping
your looping index : 1
looping
your looping index : 2
looping
looping
looping
looping
looping
looping
looping
*/

/**************************************************/
func checkDataWithfallthrough(x :Int){
    switch x {
    case 7:
      print("7")
      fallthrough
    case 9:
      print("9")
     
    case 10:
      print("10")
      
    case 11:
      print("11")
    default:
      print("default")
      break
    }
  }

checkDataWithfallthrough(x: 7)

func checkDataWithBreake(x :Int){
    switch x {
    case 7:
      print("7")
      fallthrough
    case 9:
      print("9")
      fallthrough
    case 10:
      print("10")
      fallthrough
    case 11:
      print("11")
      break
    default:
      print("default")
      break
    }
  }

checkDataWithBreake(x: 7)


