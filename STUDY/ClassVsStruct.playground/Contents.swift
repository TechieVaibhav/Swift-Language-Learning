import UIKit


/*************Simple change Class Properties*********************/
/*
class PersonClass {
    var firstName : String?
    var lastName : String?
    
    init(  firstName : String?, lastName : String?) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

let person1 = PersonClass(firstName: "Vaibhav", lastName: "Sharma")
var person2 = person1
let person3 = person2

person2.firstName = "New Value"
person3.firstName = "Great Person"
person1.firstName = "new g8"
print(person1.firstName ?? "")
print(person2.firstName ?? "")
print(person3.firstName ?? "")
*/
 /*
/****************************** Struct ******************/
 /*************Simple change Struct Properties*********************/
struct PersonStruct {
    // Value Type
    var firstName: String
    var lastName: String
    var address: String{
        get{
            return self.firstName
        } set (newValue){
            self.firstName = newValue
        }
    }
    func get() -> Bool {
        return true
    }
}

 //Cannot assign to property: 'personStruct1' is a 'let' constant
 let personStruct1 = PersonStruct(firstName: "Vaibhav", lastName: "Sharma")
 personStruct1.get()
 personStruct1.address = "dd"//Change 'let' to 'var' to make it mutable
 */

/*
var personStruct1 = PersonStruct(firstName: "Vaibhav", lastName: "Sharma")
personStruct1.get()
personStruct1.address = "dd"
let personStruct2 = personStruct1
//personStruct2.firstName = "dd" //Change 'let' to 'var' to make it mutable

var personStruct3 = personStruct1


print(personStruct1.firstName )
print(personStruct2.firstName )
print(personStruct3.firstName )
*/

/*
/******************** Mutating ******************************/
struct AnotherPersonStruct {
    // Value Type
    var firstName: String?
    static var lastName: String?
    
    static var age: String{
        get {
            return lastName ?? ""
        }
        set {
            self.lastName = newValue
        }
    }
    init(age : String) {
        AnotherPersonStruct.age = age
    }
    
    
     var address: String{
        get{
            return self.firstName ?? ""
        } set (newValue){
            self.firstName = newValue
        }
    }
    //Mark method 'mutating' to make 'self' mutable
    mutating func changeFirstName(value : String) {
        self.firstName = value
    }
     static func changeLastNameWithStatic(value : String){
        lastName = value
       
    }
     func changeLastNameWithNONStatic(value : String) ->String{
        AnotherPersonStruct.lastName = value
        return AnotherPersonStruct.lastName ?? ""
   }
}

var obj = AnotherPersonStruct(age: "20")
obj.address
obj.changeFirstName(value: "Vaibhav")
obj.changeLastNameWithNONStatic(value: "Sharma")
AnotherPersonStruct.changeLastNameWithStatic(value: "Rahul")

print(obj.address)
print(obj.firstName ?? "")
print(AnotherPersonStruct.lastName ?? "")
*/
/**********************************************************/

/***********Class holds Value Type **************/
// when refrence instance is deallocated, value type automatically de-allocated
/*
struct ValueType {
    var name : String? = "Rahul"
}
class RefrenceType{
    var valueType : ValueType?
    deinit {
        print("deinit RefrenceType ")
    }
}

var obj:RefrenceType? = RefrenceType()
obj?.valueType = ValueType()
print(obj?.valueType?.name ?? "")
obj?.valueType = nil
obj = nil
print(obj?.valueType ?? "")
*/
 /*************************/

//Case 2: Value type containing a reference type

struct MYStruct {
    var someClass = MYClass()
    var id = 1
}

class MYClass {
    var name = "Neel"
}

var myStruct = MYStruct()
print(CFGetRetainCount(myStruct.someClass)) // prints 1
var duplicateMYStruct = myStruct // Copy-On-Assignment happens here
// duplicateStruct gets a new memory with `id` being duplicated
// but the reference to someClass remains the same - IMPORTANT
// all that happens with the reference type is that is reference count increases
print(CFGetRetainCount(duplicateMYStruct.someClass)) // prints 2, now there are two structs referencing the same class
duplicateMYStruct.someClass.name = "Random"
duplicateMYStruct.id = 2
print(myStruct.someClass.name) // prints Random since it holds the reference to the same class
print(myStruct.id) // prints 1, since duplicateStruct was a copy of someStruct, changes to duplicateStruct will not effect it.
print(duplicateMYStruct.id) // prints 2

/*************Retain Cycle ************/
class A{
    var b : B?
    func getResult() -> Bool {
        return true
    }
    deinit {
        print("A is deint")
    }
}
class B{
    weak var a : A?
    deinit {
        print("B is deint")
    }
}

var objA : A? = A()
var objB: B? = B()

objA?.b = objB
objB?.a = objA
let result = objB?.a?.getResult()
print(result)
objA = nil
objB = nil
 
/*********************************/
struct SomeStruct {
    var someClass = SomeClass()
    var id = 1
}

class SomeClass {
    var name = "Neel"
}

var someStruct = SomeStruct()
print(CFGetRetainCount(someStruct.someClass)) // prints 1
var duplicateStruct = someStruct // Copy-On-Assignment happens here
// duplicateStruct gets a new memory with `id` being duplicated
// but the reference to someClass remains the same - IMPORTANT
// all that happens with the reference type is that is reference count increases
print(CFGetRetainCount(duplicateStruct.someClass)) // prints 2, now there are two structs referencing the same class
duplicateStruct.someClass.name = "Random"
duplicateStruct.id = 2
print(someStruct.someClass.name) // prints Random since it holds the reference to the same class
print(someStruct.id) // prints 1, since duplicateStruct was a copy of someStruct, changes to duplicateStruct will not effect it.
print(duplicateStruct.id) // prints 2
