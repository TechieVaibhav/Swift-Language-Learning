import UIKit

//
//  Inout_power.swift
//
//
//  Created by Vaibhav Sharma on 13/01/23.
//

import Foundation
import UIKit

/* inout keyword : Help us to mutate the function paramaters: */

var x = 10

func multiplyValue(num : inout Int){
    num *= 4
}

multiplyValue(num: &x) // passing the address.
debugPrint(x) // x is 40, becasue change will apply on variable address.



/* Problem Statement :  How to pass a variable as a refrence type or how to acheive the refrence type behaviour from Struct */

// Class : All classes in swift are refernce type, means if you pass the object,then all variables points to same memory address, that mean only a single copy is created among multiple shared references.

class ABC{
 var value = 10
}

let obj1 = ABC()
print(obj1.value) //10
let obj2 = obj1
print(obj2.value) //10

// all are same due to both are having same reference\same address.


class Match{
    var score : Int = 0
    
    func start() {
        self.score = 10
    }
}



let match = Match()
match.start()
match.score = 100
seeFinalScore(match: match)

func seeFinalScore(match: Match){
    print("final score : \(match.score)") //final score : 100
}


// Struct : A `struct` is a value type, so when we pass struct object then multiple copys are created.

// Note : always create struct object with var keyword if you want modify the properties of struct by structObj.

struct NewMatch{
    var score : Int = 0
    
    mutating func start() {
        self.score = 10
    }
}

func seeFinalScore(match: inout NewMatch){
    match.score = 100
    print("final score in value type : \(match.score)") //final score in value type : 100
}

var newMatch = NewMatch(score: 0)
newMatch.start()
seeFinalScore(match: &newMatch)//passign the memory address
print("Match score for value type outside: \(match.score)")

//Note : Actor, classes, and closures are reference type, rest all are value type in swift.

/***************************************************************/


