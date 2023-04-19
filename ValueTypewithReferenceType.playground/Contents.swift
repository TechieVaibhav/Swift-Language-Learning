import UIKit
import CoreGraphics

// Problem : what happen when Reference Type property inside the value type.

// Value Type : every time create a new copy when object is shared,passing to a function.

// Reference Type : every time a single(same memory address) refernce is shared among the shared variables.all the shared variables point to same memory location.

// So let see on code :


struct Employee{
    var name : String
    var employer: Company?
}

class Company{
    
    var name : String?
    
    init(){}
    
    deinit {
        print("the company is denit")
    }
}

var rajni = Employee(name: "Rajni", employer: Company())
var swati = Employee(name: "Swati", employer: Company())

//update the employer

rajni.employer?.name = "facebook"
swati.employer = rajni.employer


print("\(rajni.employer?.name ?? "")") // facebook
print("\(swati.employer?.name ?? "")") // facebook

rajni.employer?.name = "Google"

print("\(rajni.employer?.name ?? "")") // Google
print("\(swati.employer?.name ?? "")") // Google

// here because `Company` (employer) is reference type so both objects points to same memory location.

// But we put the reference property inside the value type, so it should be behave like `value type` neither `reference type`.
// solution :
// if we will try to make a unique copy of employer(class) every time then we can solve our problem.
// so to do this, we havce to do two things
// 1.Nscopying protocol - which will allow us to clone the employer object.
// 2.we have to check employer object having exactly single reference so that we can use the copy() to those objects which have more than refernce,then we will take a adavntage of clone object which will manage the diffrent memory location, so if change on one employer then it will not change the another one.

// point 2, system function to check the object having single reference.

class A{
    var abc: String?
}

var a = A()

if isKnownUniquelyReferenced(&a){
    print("one single reference") //one single reference
}

var b = a
if !isKnownUniquelyReferenced(&a){
    print("not having single reference") //not having single reference
}


/*

struct Employee{
    var name : String?
    private var _employer: Company
    
    var employer: Company{
        mutating get{
            if !isKnownUniquelyReferenced(&_employer){
                _employer = _employer.copy() as! Company
            }
            return _employer
        }
        set{
            _employer = newValue
        }
    }
    init(name: String, employer: Company) {
        self.name = name
        self._employer = employer
    }
}

class Company : NSCopying{
    
    var name : String?
    
    init(){}
    
    func copy(with zone: NSZone? = nil) -> Any {
        let acompany = Company()
        acompany.name = name
        return acompany
    }
    deinit {
        print("the company is denit")
    }
}

var rajni = Employee(name: "Rajni", employer: Company())
var swati = Employee(name: "Swati", employer: Company())

//update the employer

rajni.employer.name = "facebook"
swati.employer = rajni.employer


print("\(rajni.employer.name ?? "")") // facebook
print("\(swati.employer.name ?? "")") // facebook

rajni.employer.name = "Google"

print("\(rajni.employer.name ?? "")") // Google
print("\(swati.employer.name ?? "")") // facebook

*/

/*********************************************************************************************/
//2. Problem statement : what happen when we have value type inside the class or value type property inside reference type?
/*
struct Employee{
    var name : String?
}

class Company {
    
    var name : String
    var employee: Employee
    init(name : String, employee: Employee){
        self.name = name
        self.employee = employee
    }
    
    deinit {
        print("the company is denit")
    }
}


var aCompany = Company(name: "Facebook", employee: Employee(name: "Rajni"))
var bCompany = Company(name: "Google", employee: Employee(name: "Swati"))


aCompany = bCompany

// aCompany and bCompany both objects points to same memory address due to reference type behaviour.

print("\(String(describing: aCompany.employee.name))") // "Swati"
print("\(String(describing: bCompany.employee.name))") // "Swati"


// update aCompany's employee

aCompany.employee.name = "Reevansh"
print("\(String(describing: aCompany.employee.name))") // "Reevansh"
print("\(String(describing: bCompany.employee.name))") // "Reevansh"

// Conclusion: employee is a value type so it will points to a diffrent memory locations.

*/



//
//var min = array.first ?? 0
//let max = array.last ?? 0
//var lastIndex = 0
//
//while lastIndex < array.count{
//    let addedValue = array[lastIndex] + 5
//    if array.contains(addedValue){
//        let index = array.firstIndex(of: addedValue)
//        print("index -- \(String(describing: index)) -- \(addedValue)")
//        lastIndex = index ?? 0
//        print("lastIndex -- \(String(describing: lastIndex)) -- \(addedValue)")
//    } else {
//        lastIndex += 1
//        if lastIndex < array.count {
//            print("lastIndex -- \(String(describing: lastIndex)) -- \(array[lastIndex])")
//        }
//    }
//}

//93 + 5 => 98
//99
//100

var array = [77,79,82,85,88,90,93,96,101,104,107,110,112] //-> cellius array

// 77 + 5 = 82 --> index
// 82 + 5 = 87 --> index --> 88

//var addedValue = 0
//var lastindex = 0
//
//
//func getIndex(lastindex : inout Int) {
//    for (mainIndex,_) in array.enumerated() {
//
//        if array[mainIndex] >= addedValue{
//            print("mainIndex -- \(String(describing: mainIndex))")
//            lastindex = mainIndex
//            break
//        }
//    }
//}
//
//for _ in lastindex..<array.count{
//    addedValue = array[lastindex] + 5
//    print("addedValue -- \(String(describing: addedValue))")
//     getIndex(lastindex: &lastindex)
//    print("lastindex -- \(String(describing: lastindex))")
//    if lastindex == array.count{
//        break
//    }
//}

var newArray = [77,78,79,80,81,82,83,84]

var min = newArray.first ?? 0
var max = newArray.last ?? 0
var newArray2 = [Int]()
while min < max {
    newArray2.append(min)
    min = min + 5
}
print(newArray2)
