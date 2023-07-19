import UIKit

// KVO - key value observer - key value observer, when you want to track the object for changes, then you can go with KVO, in swift you can achieve the same result by using wiil set did set (property observer) to track the old and new values.

// KVC - Key Value Coding - (access the value by key) if you want to access object properties indirectly, without calling a instance variable or instance function, then first you have to make a subclass of NSobject, because KVO and KVC both are objective-c level api's.()

class AcountHolder{
    
    var name : String
    var mobileNumber : String
    
    init(name : String, mobileNumber : String){
        self.name =  name
        self.mobileNumber = mobileNumber
    }
}

//In general, create class object and access the values-

let obj = AcountHolder(name: "Vaibhav Sharma", mobileNumber: "9910831498")

print("access mobileNumber \(obj.mobileNumber)")

// now doing with NSObject Class- to access the properties by a `key`-
class NewAcountHolder : NSObject{
    
    var name : String
   @objc dynamic var mobileNumber : String
    
    init(name : String, mobileNumber : String){
        self.name =  name
        self.mobileNumber = mobileNumber
    }
}


let kvcObj = NewAcountHolder(name: "Vaibhav Sharma", mobileNumber: "9910831498")
// KVC example -
let mobileNumber = kvcObj.value(forKey: "mobileNumber")
print(mobileNumber)


// KVO example -

let kvoObj = NewAcountHolder(name: "Vaibhav Sharma", mobileNumber: "9910831498")

let result = kvoObj.observe(\.mobileNumber, options: [.new,.old]) { newAcountHolder, value in
    // will get call back when mobile number value is changed
    print("oldValue -->\(String(describing: value.oldValue))")
    print("newValue -->\(String(describing: value.newValue))")
}

kvoObj.mobileNumber = "9927441587"

/*
output
oldValue -->Optional("9910831498")
newValue -->Optional("9927441587")
*/


print(result)
