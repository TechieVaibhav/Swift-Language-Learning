import UIKit

func getvalue(index: Int) {
    switch index {
    case 1:
        print("1")
        fallthrough
    default:
        print( "with fallthrough")
    }
    
}
getvalue(index: 1)

