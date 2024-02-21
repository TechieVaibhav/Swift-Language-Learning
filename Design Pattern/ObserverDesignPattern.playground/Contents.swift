import UIKit

// Observer Design Pattern - observer object state changes.
// Real life example : If you are driving any vechle, that means you follow the Observer Pattern.
// How?- if you are driver, then on every signal you follow the lights, red, green, yellow. green light means, you can drive, red means you have to stop your vichle, yellow means you have to slow down your vichle. but on the other hand, if you are supposed to vendor, then red light means you can continue your business, green light means you have to goaway from the road.
// that means Vichle owner and vendors are observers, they behave on the basis of trafic lights.
// in observer patten, 3 things are required, add observer, remove observer, update.



struct TraficLightColor {
    static let red = "Red"
    static let green = "Green"
    static let yellow = "Yellow"
}
/*

Note : a simple way to do the class work against the traffic lights.
 
// Vehicle Observer behave as per their convient when trafic light is changed.
class VehicleObserver {
    func onTraficLightChanged(_color : String){
        if _color == TraficLightColor.red{
            print("Stop your vehicle")
        }
        if _color == TraficLightColor.green {
            print("start your vehicle")
        }
        if _color == TraficLightColor.yellow{
            print("you have to controll vehicle speed")
        }
    }
}
// Vendor observer behave dirrently as per their requirement when trafic light is changed.
class VenderObserver {
    func onTraficLightChanged(_color : String){
        if _color == TraficLightColor.red{
            print("start business")
        }
        if _color == TraficLightColor.green {
            print("stop your business")
        }
        if _color == TraficLightColor.yellow{
            print("go away")
        }
    }
}

VehicleObserver().onTraficLightChanged(_color: TraficLightColor.red)
VenderObserver().onTraficLightChanged(_color: TraficLightColor.red)

*/

protocol ObserableSubject{
    func addObserver(observer : Observer)
    func removeObserver()
}

protocol Observer{
    var id : Int{ get set}
    func update(color : String)
}


class VehicleObserver : Observer{
    var id: Int
    init(id: Int) {
        self.id = id
    }

    func update(color: String) {
        onTraficLightChanged(_color: color)
        print("update calling ...")
    }

    func onTraficLightChanged(_color : String){
        if _color == TraficLightColor.red{
            print("Stop your vehicle")
        }
        if _color == TraficLightColor.green {
            print("start your vehicle")
        }
        if _color == TraficLightColor.yellow{
            print("you have to controll vehicle speed")
        }
    }
}
// Vendor observer behave dirrently as per their requirement when trafic light is changed.
class VenderObserver : Observer{


    var id: Int
    init(id: Int) {
        self.id = id
    }

    func update(color: String) {
        onTraficLightChanged(_color: color)
    }
    func onTraficLightChanged(_color : String){
        if _color == TraficLightColor.red{
            print("start business")
        }
        if _color == TraficLightColor.green {
            print("stop your business")
        }
        if _color == TraficLightColor.yellow{
            print("go away")
        }
    }
}


// subject
class TraficLight : ObserableSubject{
    // list of observers
    private var list = [Observer]()
    private var _color : String = ""

    var color: String{
        set (newValue){
            _color = newValue
            update()
        } get{
            return _color
        }
    }

    func addObserver(observer: Observer) {
        list.append(observer)
    }

    func removeObserver() {

    }

    func update() {
        for obj in list{
            obj.update(color: color)
            print("TraficLight : \(self)")
        }
    }
}

// observer1
let observer1 = VenderObserver(id: 0)
let observer2 = VehicleObserver(id: 1)

let sublectWhichIsObserable = TraficLight()
sublectWhichIsObserable.addObserver(observer: observer1)
sublectWhichIsObserable.addObserver(observer: observer2)

sublectWhichIsObserable.color = TraficLightColor.yellow
