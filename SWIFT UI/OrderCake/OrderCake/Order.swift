//
//  Order.swift
//  OrderCake
//
//  Created by Vaibhav Sharma on 08/05/24.
//

import Foundation

@Observable
class Order {
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    
    var extraFrosting = false
    var addSprinkles = false

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
}
