import UIKit

//Introducing Sets
/*
-- No Order
-- No Duplication
*/
//set is struct
var set = Set<String>()
set.insert("Vaibhav")
set.insert("Sharma")
print(set)//["Sharma", "Vaibhav"]


var set2 = [1,3,4,5,6]
print(set2) //[1, 3, 4, 5, 6]

var set3: Set<String> = Set(arrayLiteral: "Vaibhav", "Sharma","Mrt")
print(set3) //["Mrt", "Vaibhav", "Sharma"]

var set4: Set = Set(["Vaibhav", "Sharma","Mrt"])
print(set4) //["Mrt", "Vaibhav", "Sharma"]


var oddNumberSet : Set = Set<Int>()
var evenNumberSet : Set = Set<Int>()

for number  in 1..<20 {
    if number % 2 == 0{
        evenNumberSet.insert(number)
    } else {
        oddNumberSet.insert(number)
    }
}
//print(evenNumberSet)
//print(oddNumberSet)

//Union
//evenNumberSet.union(oddNumberSet)// 19 items from 1 to 19
//intersection -- common items
evenNumberSet.intersection(oddNumberSet) // Set([]) , empty set --> found 0 items
//subtract
evenNumberSet.subtract(oddNumberSet) // all items from even number ser {4, 6, 10, 16, 18, 12, 8, 14, 2}
