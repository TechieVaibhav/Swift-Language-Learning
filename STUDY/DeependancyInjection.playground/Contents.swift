import UIKit

//Exp 1
//Plain Class
class Collage {
   var name = "JP Aacademy"
  //  var princeple  = Princeple(name: "Senior Adam", age: 80)
    var princeple: Princeple?
   //remove dependency by init function
    init(princeple : Princeple) {
        self.princeple = princeple
    }
}

//Exp 2
class School {
    //School Class is a have dependency with principle
    //now
    //var princeple  = Princeple(name: "Adam", age: 70) // same  var princeple  : Princeplen = Princeple()
    var princeple: Princeple?
   //remove dependency by init function
    init(princeple : Princeple) {
        self.princeple = princeple
    }
    
    func accessPrincle() -> String {
        return princeple?.name ??  ""
    }
}
//New requiremnet comes --- principle age
class Princeple {
    var name : String // predefind
    var age : Int
    var degree : String
    init(name : String, age : Int, degree : String) {
        self.name = name
        self.age = age
        self.degree  = degree
    }
    //instance function
    func setName(name : String)  {
        self.name = name
    }
    
    //getter/set
    var changeName : String{
        get {
            return name
        }
        set (newValue) {
         name = newValue
        }
    }
}

//just create a object for school
let schoolPrinciple = Princeple(name: "Adam", age: 70, degree: "Master PHD")
//no dependency
let school = School(princeple: schoolPrinciple)

school.accessPrincle()
//
school.princeple?.name
school.princeple?.age
school.princeple?.degree

//
let collagePrinciple = Princeple(name: "Senior Adam", age: 80, degree: "PHD")
let collage = Collage(princeple: collagePrinciple)
collage.name
collage.princeple?.name


//dependy inverse Rules
//by making init function
//property wrapper way



