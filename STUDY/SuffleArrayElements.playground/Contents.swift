import UIKit



//let array = [1,3,5,7,9,11]
//print("inputArray : --- \(array)")
//for _ in 0...10 {
//
//    suffleElements(inputArray: array)
//}
//
//
//// Question 2: Given Conditions: 1. Intput array, 2. You are also given a hypothetical function random() that will return a random number between 1 to 10,000,000,7.
////1 . challenge random number constarint between 0 to array.lenght
//
//func suffleElementsWithSpecificRange(inputArray :  [Int]) {
//    // rand()'s range should be lie between 0 to array.count/length
//    var oldArray = inputArray
//    // 1. variable to hold randomNumber
//    var randomNumber : Int
//    // 2. variable to hold array's length
//    let arraylength = inputArray.count
//    // 3. variable to hold temp array which is usefull to suffling the array elements.
//    var temp = [Int]()
//    for i in 0..<arraylength {
//        //4. calculate random number
//        randomNumber =  (Int.random(in: 0..<100000007) % (i + 1))
//        print("randomNumber : --- \(randomNumber)")
//        //5. add random number element from orignal array to temp array
//        //temp.append(oldArray[randomNumber])
//        //6. remove elemnt from orignal array
//        //oldArray.remove(at: randomNumber)
//    }
//    print("temp : --- \(temp)")
//}
//let array = [1,3,5,7,9,11]
//suffleElementsWithSpecificRange(inputArray: array)

// Question 1: Given Conditions: 1. Intput array, 2. random()
//func suffleElements(inputArray :  [Int]) {
//    // rand()'s range should be lie between 0 to array.count/length
//    var oldArray = inputArray
//    // 1. variable to hold randomNumber
//    var randomNumber : Int
//    // 2. variable to hold array's length
//    let arraylength = inputArray.count
//    // 3. variable to hold temp array which is usefull to suffling the array elements.
//    var temp = [Int]()
//    for _ in 0..<arraylength {
//        //4. calculate random number
//        randomNumber =  Int.random(in: 0..<oldArray.count)
//        //5. add random number element from orignal array to temp array
//        temp.append(oldArray[randomNumber])
//        //6. remove elemnt from orignal array
//        oldArray.remove(at: randomNumber)
//    }
//    print("temp : --- \(temp)")
//}
//suffleElements(inputArray: [1,3,4,5,6])


/*
func suffleElements(inpArray :  [Int]) {
    var inputArray = inpArray
    // 1. variable to hold randomNumber
    var randomNumber : Int
    // 2. variable to hold array's length
    let arraylength = inpArray.count
    
    for i in 0..<inputArray.count {
        //4. calculate random number
        //randomNumber = 0
        repeat {
            randomNumber =  Int.random(in: 0..<100000) % (arraylength)
        } while randomNumber == (arraylength - 1)
      
        print("randomNumber: ---\(randomNumber)")
        print("i : --- \(i)")
        let temp = inputArray[((arraylength - 1) - i)]
        print("temp number: ---\(temp)")
        inputArray[((arraylength - 1) - i)] = inputArray[randomNumber]
        print(" inputArray[i]: ---\( inputArray[((arraylength - 1) - i)])")
        inputArray[randomNumber]  =  temp
        print("inputArray nest: ---\(inputArray)")
      //  arraylength = arraylength - 1
       // print("arraylength: ---\(arraylength)")
        print("******************************************************")
    }
    print("temp : --- \(inputArray)")
}

suffleElements(inpArray:  [1,3,4,5,6]) */

Calendar.current.date(byAdding: .year, value: 0, to: Date())
