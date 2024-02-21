import UIKit

// Builder Design Pattern - object creation process seprate from it's actual usage.

protocol ShoeBuilder{
    func produce()
}

class Nike: ShoeBuilder {
    func produce() {
        print("Nike shoe produce...")
    }
}

class Director{
    let builder : ShoeBuilder
    init(builder: ShoeBuilder) {
        self.builder = builder
    }

    func produce() {
        builder.produce()
    }
}

let nike = Nike()
let director = Director(builder: nike)
director.produce()


