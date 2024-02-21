import UIKit
// Error/exception Handling

// Error - is a protocol
// adopt error protocol to handle the exception in swift.

enum ATMError : Error{
    case insufficientFund( availableAmount : Int)
    case invalidPin
}

class ATMMachine {
    func witdrawCash(enterAmount : Int) throws {
        if enterAmount < 500 {
            throw ATMError.insufficientFund(availableAmount: 500)
        }
    }
}

// always surrond with do-catch for exception handling

do {

    try ATMMachine().witdrawCash(enterAmount: 1000)
} catch ATMError.insufficientFund ( let availableAmount){
    print(availableAmount)
}catch ATMError.invalidPin{
    print(" you enter invalid Pin ")
}
