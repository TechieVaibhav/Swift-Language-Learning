import UIKit

//Computed Property : - it always compute something to us.


var score : Int = 0
var totalScore : Int {
    get {
        return score * 5
    }
    set (newValue){
        score = newValue
    }
}

totalScore = 50
print(totalScore)

var raidius : Double = 0
var dimeter : Double {
    get {
        return raidius * 2
    }
    set {
      raidius = newValue/2
    }
}

dimeter =  40
print(dimeter)

struct MyStruct {
    var raidius : Double = 0
    var dimeter : Double {
        get {
            return raidius * 2
        }
        set {
          raidius = newValue/2
        }
    }
}

var obj = MyStruct()
obj.dimeter = 10
print(obj.raidius)
