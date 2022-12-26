import UIKit

class ABC {
    var description : String {
        return "description about \(Self.self)"
    }
}
class XYZ : ABC {
    override var description: String{
        return super.description
    }
}

let obj : ABC = XYZ() as ABC
obj.description // "description about XYZ"
