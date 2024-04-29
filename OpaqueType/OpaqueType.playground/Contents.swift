import UIKit


// Opaque type - when we are having a generic protocol, we are tring to return a protocol from a function instead of a concrete type, then `some` keyword is required.
// use to achieve the encapsulation - hiding the implementaion details, showing only functionality.
// The `some` keyword is required to opaque type.


protocol Car{
    associatedtype ManufacturingYear
    func getCarName() -> String
}

struct AudiCar : Car{
    typealias ManufacturingYear = Int

    func getCarName() -> String {
        return "hey i am a Audi Car"
    }
}

struct NexonCar : Car{
    typealias ManufacturingYear = String

    func getCarName() -> String {
        return "hey i am a Nexon Car"
    }
}

func getCarInfo() -> some Car {
    return AudiCar()
}
getCarInfo().getCarName() // hey i am a Audi Car //

