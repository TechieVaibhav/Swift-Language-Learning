import UIKit

// tuples : touples are used to group the multiple data.

let atuple = (4,5,6)
print(atuple.2)//6

let anotherTuple = (4,"hey",9.90)
print(anotherTuple.0) // 4
print(anotherTuple.2) // 9.90

let namedTuple = (x:5,y:"hey",z: 29.90)
print(namedTuple.z) //29.90

let touple3 : (x: Int, y: Double, function : ()->Void)
touple3 = (5,6.7,{print("Hey you call me!!") })
print(touple3.x) //5
touple3.function() //Hey you call me!!

func isValidUserName(username : String) -> (errormesage : String?, errorCode : Int) {
    if username.isEmpty{
        return (errormesage : "Empty User Name", errorCode : 503)
    }
    return (errormesage : nil, errorCode : 200)
}
let result = isValidUserName(username: "")
print(result.errorCode) //503
print(result.errormesage ?? "") //"Empty User Name"

// swap values with tuples
var a = "a"
var b = "b"
(a,b) = (b,a)
print(a,b)
