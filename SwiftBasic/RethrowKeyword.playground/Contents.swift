import UIKit

enum MYError : Error{
    case customError
}

func inner() throws {
    print("inner calling..")
    throw MYError.customError

}

func wrapper( inner : () throws -> Void) rethrows {
    do {
        try inner()
    } catch {
        throw MYError.customError
    }
}

do {
    try wrapper {
        print("wrapper")
        throw MYError.customError
    }
} catch {
}

