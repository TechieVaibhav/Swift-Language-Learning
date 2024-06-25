import UIKit


//find even number or odd NumberFormatter
/*
 func isEven(num : Int) -> Bool{

 return ((num & 1) == 0)
 }

 isEven(num: 5)

 func checkEvenNumber(num : Int) -> Bool {
 var isEven = true

 for _ in 1...num{
 isEven = !isEven
 }
 return isEven
 }

 checkEvenNumber(num: 4)

 func evenNumber(num : Int) -> Bool {
 return ((num/2) * 2 == num)
 }
 evenNumber(num: 4)
 */




// array : [1,2,3,4]
// 1 -> 2 * 3 * 4
// 2 -> 1 * 3 * 4
// 3 -> 1 * 2 * 4
// 4 -> 1 * 2 * 3
// O(n)
/*
 func productExceptSelf(arr : [Int]) {

 var totalProduct = 1
 var productResult = [Int](repeating: 0, count: arr.count)
 for num in arr {
 totalProduct *= num
 }
 print(totalProduct)

 for i in 0..<arr.count {
 print("i is > \(i) and \(totalProduct/arr[i])")
 productResult[i] = (totalProduct/arr[i])
 }
 print(productResult) //[6, 3, 2]
 }
 productExceptSelf(arr: [1,2,3])
 */
//num1
//num2
//num1 * num2
// 10 * 2 = 20
/*
 func multiplyWithoutMultiplicationOperator(num1 : Int, num2 : Int){
 var loopRange = 0
 var largeNum = 0
 if num1 < num2 {
 loopRange = num1
 largeNum = num2
 } else {
 loopRange = num2
 largeNum = num1
 }
 var multiplicationResult = 0

 for _ in 0..<loopRange{
 multiplicationResult += largeNum
 }
 print(multiplicationResult)
 }

 multiplyWithoutMultiplicationOperator(num1: 10, num2: 2)
 */
/*
 func findSum(arr : [Int], findSum : Int){
 var leftPointer = 0
 var rightPointer = arr.count - 1

 while leftPointer < rightPointer {
 let sum = arr[leftPointer] + arr[rightPointer]
 if sum == findSum {
 print("pairs : { \(arr[leftPointer]) \(arr[rightPointer])}")
 } else if sum > findSum{
 rightPointer -= 1
 } else {
 leftPointer += 1
 }
 }

 }

 findSum(arr: [1,3,4,2], findSum: 5)
 */
/*
 func factorial(num : Int) -> Int{
 if num == 1 || num == 0 {
 return 1
 }
 return num * factorial( num: num - 1)
 }

 factorial(num: 5)
 */
/*
func factorial(num : Int) -> Int{
    var fact = 1
    if num <= 1{
        return fact
    }
    for i in 2...num{
        fact = fact * i
    }
    print("fact \(fact)")
    return fact
}

factorial(num: 1)
*/

func findTheLargetNumber(arr : [Int]) -> Int{
var max = arr[0]
    for i in 0..<arr.count{
        if arr[i] > max{
            max = arr[i]
        }
    }
    return max
}

func findTheMinNumber(arr : [Int]) -> Int{
var min = arr[0]
    for i in 0..<arr.count{
        if arr[i] < min{
            min = arr[i]
        }
    }
    return min
}

func findLargetScondNumber(arr : [Int]) {
  var max = findTheMinNumber(arr: arr)
  var secondMax = findTheMinNumber(arr: arr)

    for i in 0..<arr.count {
        if arr[i] > max{
            secondMax = max
            max = arr[i]
        }
        if arr[i] < max && arr[i] > secondMax {
            secondMax = arr[i]
        }
    }
    print("max and second Max : \(max) \(secondMax)")
}
findLargetScondNumber(arr: [1,4,2,5])

