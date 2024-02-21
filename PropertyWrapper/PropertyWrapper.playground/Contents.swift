import UIKit
import Foundation

// Problem Statement : Validate the email address.

// tradional way: Create a extention function over string to validate the email address.
extension String {

    func isEmailAddressValid() -> Bool {
        if self.count < 10 {
            return false
        } else {
            return true
        }
    }
}

struct User {
    var email : String
    var password : String

    func doLogin() {
        if email.isEmailAddressValid() {
            // go to authentication
            print("go to authentication")
        } else {
            print("please enter valid email address")
        }
    }
}

let user = User(email: "vaibhav", password: "1234")
user.doLogin()
user.password.isEmailAddressValid() // becoz isEmailAddressValid function does not have any meaning to validate the password, so resolve this problem, property wrapper is introduce.

// New Way by property wrapper

@propertyWrapper struct Validator {
    private var _enterPin : String

    init(_enterPin: String) {
        self._enterPin = _enterPin
    }

    var wrappedValue: String {
        get {
            return isPinValid() ? _enterPin : String()
        } set{
            _enterPin = newValue
        }
    }

    private func isPinValid() -> Bool {
        if _enterPin.count < 6 {
            return false
        } else {
            return true
        }
    }

}


struct ATM {
   @Validator var pin : String
    var amount : String

    func withdrawAmount() {
        if pin.isEmpty {
            // go to authentication
            print("enter a pin")
        } else {
            print("withraw amount is ready")
        }
    }
}

let atm = ATM(pin: Validator(_enterPin: "123456"), amount: "1200")
atm.withdrawAmount()

