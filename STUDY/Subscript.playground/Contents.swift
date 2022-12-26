import UIKit


//Problem : When i create an object and want a shortcut to access values without calling method.
// used [ ] square brackets to call the subscript

//Example 1
//Array
struct Person{
    var address = ["Meerut", "Shimla", "Delhi", "Bombay"]
    subscript(index : Int) -> String{
        get{
            return address[index]
        }
    }
}
let person = Person()
person[3]
//Example 2
//Dictionary
//Dict bydefault return optional value, so we can wrapped value by using subscript
struct HealthInfo{
    var health = ["Height": 130, "Fat": 20, "Weight": 90]
    subscript(key : String) -> Double{
        get{
            if let value = health[key] {
                return Double(value)
            } else {
                return 0
            }
        }
    }
}
let healthInfo = HealthInfo()
healthInfo["Height"]
healthInfo["Address"]


//Example 3
struct WeekDays{
    private var days = ["Mon","Tues","Wed","Thrus","Friday"]
    subscript(index : Int) -> String{
        get{
            return days[index]
        }
    }
}
let weekDays = WeekDays()
weekDays[2]



//Example 4
//Genric Subscript
struct Json {
    private var storage: [String : Any]?
    
    init(dataDict : [String : Any]) {
        self.storage = dataDict
    }
    subscript <T>(key : String) -> T?{
        return storage?[key] as? T
    }
}
let obj = Json(dataDict: ["x":10.2, "y":"kilo","z":10,"v":"Vijay"])
let xResult : Double? = obj["x"]
let yResult : String? = obj["y"]
let zResult : Int? = obj["z"]
let vResult : String? = obj["v"]


//Example 5
//Question1: Search Substing:
//Use This Extension Just TO Subscript
/*
@available (macOS 10.15, * )
extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}

func isSubStringPartOfString(mainString : String, subString : String)->Int{
    let sub = subString.count
    let main = mainString.count
    
    for index in 0..<main{
        var jIndex: Int = 0
        /* For current index, check for
         // pattern match */
        for kIndex in 0..<sub {
            if mainString[(index + kIndex)] != subString[kIndex] {
                break
            }
            
            jIndex = kIndex
        }
        if ((jIndex + 1) == sub) {
            return index
        }
    }
    return -1;
}

let result = isSubStringPartOfString(mainString: "I love cheese burst pizza", subString: "curst")
if (result == -1) {
    print("no")
}
else {
    print("yes")
    
}
*/

//Another Subscript usage
public extension String {
    
    /**
     Enables passing in negative indices to access characters
     starting from the end and going backwards.
     if num is negative, then it is added to the
     length of the string to retrieve the true index.
     */
    func negativeIndex(_ num: Int) -> Int {
        return num < 0 ? num + self.count : num
    }
    
    func strOpenRange(index i: Int) -> Range<String.Index> {
        let j = negativeIndex(i)
        return strOpenRange(j..<(j + 1), checkNegative: false)
    }
    
    func strOpenRange(
        _ range: Range<Int>, checkNegative: Bool = true
    ) -> Range<String.Index> {

        var lower = range.lowerBound
        var upper = range.upperBound

        if checkNegative {
            lower = negativeIndex(lower)
            upper = negativeIndex(upper)
        }
        
        let idx1 = index(self.startIndex, offsetBy: lower)
        let idx2 = index(self.startIndex, offsetBy: upper)
        
        return idx1..<idx2
    }
    
    func strClosedRange(
        _ range: CountableClosedRange<Int>, checkNegative: Bool = true
    ) -> ClosedRange<String.Index> {
        
        var lower = range.lowerBound
        var upper = range.upperBound

        if checkNegative {
            lower = negativeIndex(lower)
            upper = negativeIndex(upper)
        }
        
        let start = self.index(self.startIndex, offsetBy: lower)
        let end = self.index(start, offsetBy: upper - lower)
        
        return start...end
    }
    
    // MARK: - Subscripts
    
    /**
     Gets and sets a character at a given index.
     Negative indices are added to the length so that
     characters can be accessed from the end backwards
     
     Usage: `string[n]`
     */
    subscript(_ i: Int) -> String {
        get {
            return String(self[strOpenRange(index: i)])
        }
        set {
            let range = strOpenRange(index: i)
            replaceSubrange(range, with: newValue)
        }
    }
    
    
    /**
     Gets and sets characters in an open range.
     Supports negative indexing.
     
     Usage: `string[n..<n]`
     */
    subscript(_ r: Range<Int>) -> String {
        get {
            return String(self[strOpenRange(r)])
        }
        set {
            replaceSubrange(strOpenRange(r), with: newValue)
        }
    }

    /**
     Gets and sets characters in a closed range.
     Supports negative indexing
     
     Usage: `string[n...n]`
     */
    subscript(_ r: CountableClosedRange<Int>) -> String {
        get {
            return String(self[strClosedRange(r)])
        }
        set {
            replaceSubrange(strClosedRange(r), with: newValue)
        }
    }
    
    /// `string[n...]`. See PartialRangeFrom
    subscript(r: PartialRangeFrom<Int>) -> String {
        
        get {
            return String(self[strOpenRange(r.lowerBound..<self.count)])
        }
        set {
            replaceSubrange(strOpenRange(r.lowerBound..<self.count), with: newValue)
        }
    }
    
    /// `string[...n]`. See PartialRangeThrough
    subscript(r: PartialRangeThrough<Int>) -> String {
        
        get {
            let upper = negativeIndex(r.upperBound)
            return String(self[strClosedRange(0...upper, checkNegative: false)])
        }
        set {
            let upper = negativeIndex(r.upperBound)
            replaceSubrange(
                strClosedRange(0...upper, checkNegative: false), with: newValue
            )
        }
    }
    
    /// `string[...<n]`. See PartialRangeUpTo
    subscript(r: PartialRangeUpTo<Int>) -> String {
        
        get {
            let upper = negativeIndex(r.upperBound)
            return String(self[strOpenRange(0..<upper, checkNegative: false)])
        }
        set {
            let upper = negativeIndex(r.upperBound)
            replaceSubrange(
                strOpenRange(0..<upper, checkNegative: false), with: newValue
            )
        }
    }

}
let text = "012345"
print(text[2]) // "2"
print(text[-1]) // "5"

print(text[1...3]) // "123"
print(text[2..<3]) // "2"
print(text[3...]) // "345"
print(text[...3]) // "0123"
print(text[..<3]) // "012"
print(text[(-3)...]) // "345"
print(text[...(-2)]) // "01234"


func getArray(inputArray : [Int])->[Int] {
    var timeAdjustments = [Int]()
    for i in inputArray {
        switch i {
        case 20...:
            timeAdjustments.append(50)
        case 15...:
            timeAdjustments.append(70)
        case 10...:
            timeAdjustments.append(80)
        case 5...:
            timeAdjustments.append(90)
        case 0...:
            timeAdjustments.append(100)
        default: print("out of range")
        }
    }
    return timeAdjustments
}

getArray(inputArray: [3,12,4,9,17,22])




struct Counting{
    var numbers = [1,2,3,4,45,5]
    subscript (index : Int) -> Int {
        return numbers[index]
    }
}

//tradional way to getting specific number from numbers

let countingObj = Counting()
countingObj.numbers[3] // 4

// by subscript
countingObj[3] // 4

