import UIKit


// enum is a group of related values which enable you to work with those values into a safe way.
// enum raw value - which is defined by user.
// enum hash value - hash value is a logic index.
// CaseIterable prtocol - unable us to know that how much total cases are define into enums.allow us to itreate over the enum cases.

enum Weekdays : Int, CaseIterable{
    case monday,tuesday,wednesday, thrusday, friday
}


let weekday = Weekdays.monday


print("\(weekday.rawValue)")
print("\(weekday.hashValue)")

print("\(Weekdays.allCases.count)")

for day in Weekdays.allCases {
    print("\(day.rawValue)")
}

/****************************** Associated values *********************************/

enum SocialMediya {
    
    case facebook(totalfrends : Int)
    case instagram(totalfollowers : Int)
}

let socialMediya = SocialMediya.instagram(totalfollowers: 10)
print(socialMediya)

switch socialMediya {
case .facebook(let totalfriends):
    print("totalfriends is ",totalfriends)
case .instagram(let totalfollowers):
    print("totalfollowers is ",totalfollowers)
}


/****************************** Recursive Enum *********************************/

indirect enum  ArthmaticExpression{
 case number(num1 : Int)
 case addition(left : ArthmaticExpression, right: ArthmaticExpression)
 case multiplication(left : ArthmaticExpression, right: ArthmaticExpression)
    
}


let num1 = ArthmaticExpression.number(num1: 10)

let num2 = ArthmaticExpression.number(num1: 20)


let sum = ArthmaticExpression.addition(left: num1, right: num2)
let multiplication = ArthmaticExpression.multiplication(left: num1, right: num2)

let productMultiplication = ArthmaticExpression.multiplication(left: sum, right: num1)

func evaluate(arthmaticExpression : ArthmaticExpression)-> Int{
    switch arthmaticExpression{
    case .number(let value):
       return value
    case .addition(let leftValue, let rightValue):
       return evaluate(arthmaticExpression: leftValue) + evaluate(arthmaticExpression: rightValue)
    case .multiplication(let leftValue, let rightValue):
        return evaluate(arthmaticExpression: leftValue) * evaluate(arthmaticExpression: rightValue)
    }
    
}

evaluate(arthmaticExpression: sum) //30
evaluate(arthmaticExpression: multiplication) //200
evaluate(arthmaticExpression: productMultiplication) // 30 * 10 = 300



/******************************* Frozen & Non-Frozen Enum *****************************************/

// Frozen is introduced in swift 5, frozen enum is specially designed to fix the enum scope for new cases, that meant no new case will be add by sdk. generally used on sdk level, to make the frozen enum, keyword is @frozen.

// Non - frozen enum : without @frozen keyword, bydefault all enums are non-frozen, we can add new cases when we want as per reqiurement.

// @unkown default vs default --   @unkown default gives the warning when new case is added into the enums.
// default -- will use to handle the rest cases (i mean remaining cases), so when we add new cases into the enum then it will not give us warnings.


@frozen
enum Option {
  case A
  case B
  case C
}

func optionSelected(option: Option) {
  switch(option) {
    case .A:
      print("You chose A!")
    case .B:
      print("You chose B!")
  @unknown default:
      print("You chose other option!")
  }
}

enum OnlineShoping :Error {
    case invalidUrl
    case itemNotFound
    
    func description() -> String{
        switch self {
        case .invalidUrl:
            return "hey invalid address"
        default:
            return "Hey right now item not available in inventry"
        }
    }
}

func doSomething(validate : Int) throws {
    switch validate{
    case 0:
        throw OnlineShoping.invalidUrl
    case 1:
        throw OnlineShoping.itemNotFound
    default :
        break
    }
    
}

do {
    try doSomething(validate: 1)
} catch let error {
    if let onlineShopingError = error as? OnlineShoping {
        print(onlineShopingError.description())
    } else {
        print("Unexpected error: \(error)")
    }
}








