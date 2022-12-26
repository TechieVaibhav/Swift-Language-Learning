import UIKit

// Problem Statement: calculate Power a^b without multiplication operator.

// So a^b is nothing but multiplication of a by b times.
// 3^2 = 3*3 => 9
// 5^5 = 5*5*5*5*5 => 3125

//so now, 5^5 =>
//1. 5 + 5 + 5 + 5 + 5 => 25
//2. 25 + 25 + 25 + 25 + 25 => 125
//3. 125 + 125 + 125 + 125 + 125 => 625
//4. 625 + 625 + 625 + 625 + 625 => 3125

//here, we have to add 5 exactly 5 times and total iteration will occurs total 4times, that meant a will be add by a times for b-1 iteration.
       
// calculate 5^5 // out : 3125

// calculate 3^2 // out : 9


func  calculatePowerWithMultiplicationOperator(base : Int, power: Int)-> Int{
    if power == 0 {
        return 1
    } else {
        let a = base
        var result = base
        for _ in 1..<power{
            result = result*a
        }

        print(result)
        return result
    }
}

calculatePowerWithMultiplicationOperator(base: 3, power: 0)


func  calculatePowerWithoutMultiplicationOperator(base : Int, power: Int)-> Int{
    if power == 0 {
        return 1
    }
    var result = base
    var a = base

    for _ in 1..<power{
        for _ in 1..<base{
            
            result += a
        }
        a = result
    }

    print(result)
    return result
}

calculatePowerWithoutMultiplicationOperator(base: 3, power: 0)



