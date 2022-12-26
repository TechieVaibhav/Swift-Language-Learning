import UIKit

// Property Observer : when you want to track/observer changes to a property.
// will set -- told you about the value which will set (call before setting new value) (new value)
// did set -- takes call after setting the value. (track old value )
//Note : property observer will not call when you initialize it , it always call when you set it.
//Note : property observer always required a default initalizer( default value), if you not set default value then it will throws compilier error.

var xyz : Int = 0 {
    willSet {
        print("willSet value set --> \(newValue)")
    } didSet {
        print("didSet value set --> \(oldValue) new value is --> \(xyz)")
    }
}


xyz = 100
//willSet value set --> 100
//didSet value set --> 0 new value is --> 100
xyz = 101
//willSet value set --> 101
//didSet value set --> 100 new value is --> 101


var abc : Int = 11 {
    willSet {
        print("willSet value set --> \(newValue)")
    } didSet (oldValue){
        if oldValue > 10 {
            print("didSet value set --> \(oldValue) new value is --> \(abc)")
        } else {
            print("didSet value set --> \(oldValue) new value is --> \(abc)")
        }
        
    }
}

abc = 999998
//willSet value set --> 999998
//didSet value set --> 11 new value is --> 999998
