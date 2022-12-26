import UIKit
// 2 phase init
//.. only Value Types supported ,. not by classes because they support the inheritance, inside value types a init can call another init for initalization process because another init function is also a part of same struct/enum.
// for code reusability

struct RocketLauncher {
    var meeter: Double
    
    init(  meeter: Double) {
        self.meeter = meeter
    }
    
    init( km: Double) {
       let convertedMeeter = km*1000
        self.init( meeter: convertedMeeter)
    }
}

//for india
let indiaRocket = RocketLauncher(meeter: 20)
indiaRocket.meeter

//for UK
let ukRocket = RocketLauncher(km: 20)
ukRocket.meeter



internal enum MyEnum: Int {
    case Zero = 0, One, Two
//    init?(string: String) {
//        switch string.lowercased() {
//        case "zero": self = .Zero
//        case "one": self = .One
//        case "two": self = .Two
//        default: return nil
//        }
//    }
    init(string: String) {
        switch string.lowercased() {
        case "zero": self = .Zero
        case "one": self = .One
        case "two": self = .Two
        default:
            self = .Zero
        }
    }
}
let myEnum = MyEnum(string: "Two")
