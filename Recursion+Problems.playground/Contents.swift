import UIKit

// What is Recursion
// how to use.
// Problem solved with recursion.


//  What is Recursion : recursion is a technique where each function call itself.

// how to use - so there 3 steps taht can be consider for recursion :
// 1. Finding Base Case/Base Condition: - for any given problem, which is the initial input/case (or minium input)

// 2. Finding relation between problem:- a sub problem or relation to solve the big problem like as - let consider there are first 7 natural numbers,we need to perform the addition(7)/sum(7) so here we can break it into sub problem/we can find a relation, like as sum(6) + 1, that meant if we are able to find out sum(6) and then we can easily calculate the sum(7) just by additing 1 to sum(6).

// 3. Generalise your function. so here in final step you have to make your fuction genric to solve all problem in a recursive way.

//Note : in recusrion, after every step your problem becomes smaller like you have 111111 ( total 6 sticks), now we added there one more stick 111111 1 , now we want count the total sticks, so as we now in previously we have 6sticks then we just added one so 6 + 1 = 7.

// relation to solve stick problem , F(7) = F(6) + 1
// genreal form f(n) = f(n-1) + 1



// one more hint, problem always start from end point to top point, like we have to calculate sum of n numbers, then add n==0 as a termination condition and every time we need to pass n-1 to reduce n till 0.



// Problem 1. write a function to print your name 10 times recursivly.
// hint : 10 is a termintion condition to break the recurion calls, otherwise you will face a stack overflow due to infinte calls.
/*
func printYourName(n : Int){
    if n == 0{
        return
    }
    print("My name is vaibhav sharma.")
    printYourName(n: n-1)
}

printYourName(n: 10)

*/



// Problem 2. find sum of first 10 natural number recursivly.
/*
func findSumWithOutRecursion(n : Int){
    if n == 0{
        return
    }
   var result = 0
    for i in 1..<n+1{
        result = result + i
    }
    print(result)
}
findSumWithOutRecursion(n: 10)

 */

/*
func findSumWithRecursion(n : Int) -> Int{
    if n == 1{
        return 1
    }
    print(n)
    return findSumWithRecursion(n: n-1) + n
}

findSumWithRecursion(n: 15) // 120
 */
 

// Problem 3. find power a^b with recursion.
/*
func powerWithoutRecursion(a : Int, b : Int) -> Int{
    if b == 0{
        return 1
    }
    var result = a
    for _ in 0..<b-1{
        result  = result * a
    }
    return result
}

powerWithoutRecursion(a:3, b: 1)
*/

/*
func power(a : Int, b : Int) -> Int{
    if b == 0{
        return 1
    }
    return power(a: a, b: b-1)*a
}

power(a:3, b: 2)
 */

// fast way to calculate power

/*
var stepCounter = 0
func fastPower(a : Int, b : Int) -> Int{
    stepCounter += 1
    print(stepCounter)
    if b == 0{
        return 1
    }
    if b % 2 == 0{
        return fastPower(a: a*a, b: b/2)
    }
    return fastPower(a: a, b: b-1)*a
}

fastPower(a:3, b: 20)
 */


/*
var stepCounter = 0
func fastPower(a : Int, b : Int) -> Int{
    stepCounter += 1
    print(stepCounter)
    if b == 0{
        return 1
    }
    if b % 2 == 0{
        return fastPower(a: a*a, b: b/2)
    }
    return fastPower(a: a, b: b-1)*a
}

fastPower(a:3, b: 20)
 */

// Problem 4. find factorial for given n number.

/*
func factorial(n: Int) -> Int{

    if n == 1{
        return 1
    }
    return n * factorial(n: n-1)
}

factorial(n: 5) //120
*/



// Problem 5. print first 50 natural numbers.
/*
var n = 1
func printNaturalNumber(n: Int) -> Int{
    
    if n <= 50{
        print(n)
        return printNaturalNumber(n: n+1)
    }
    return -1
    
}
printNaturalNumber(n: n)

*/

// Problem 6. fibonacci series find nth number.

/*
func findnthFromFibonacci(n : Int) -> Int{
    if (n == 1 || n == 2) {
        return 1
    }
    return findnthFromFibonacci(n: n-1) + findnthFromFibonacci(n: n-2)
}

print(findnthFromFibonacci(n: 6)) // 8
 
 */

// Problem 7. fibonacci series print till given number range.
/*
var c = 0
var a = 0
var b = 1

func printSeries(){
    print("\(a)")
    print("\(b)")
    printFibonacciSeries(n: 20 - 2) // because 2 terms are already known
    
}


func printFibonacciSeries(n : Int) {

    if n >= 1{
        c = a + b
        print(c)
        a = b
        b = c
        printFibonacciSeries(n: n-1)
        
    }
}

printSeries()
 */


// Problem 8. find all posible paths from n*m grid/matrix.
// pre-condition : 1. you can trak/travel/go only in right direction or in bottom direction.

// f(n,m) = f(n-1, m) + f(n,m-1)

// f(4,4) = f(3,4)+ f(4,3)
// base condition n,m == 1, 1 only one path posible.
/*
func findPathFromMatrix(n : Int, m : Int) -> Int{
    if n == 1 || m == 1{
        return 1
    }
    
    return findPathFromMatrix(n: n-1, m: m) + findPathFromMatrix(n: n, m: m-1)
}

print(findPathFromMatrix(n: 4, m: 4))
 
// hint : genric function -- f(n,m) = f(n-1,m) + f(n, m-1), where f(n-1,m) is come based on row and f(n, m-1) is coming from coloumn.
// how we are getting  f(n-1,m)+f(n,m-1)=6. If we do n-1, by recursion at last it will become (1,m) and will return 1. Similarly, If we do m-1, by recursion at last it will become (n,1) and will return 1. and f(1,m)+f(n,1) will give 2.  that is how I am thinking can anyone help me out for thinking this code practically.
 
*/


// Problem 9. Josephus problem
/*
In computer science and mathematics, the Josephus Problem (or Josephus permutation) is a theoretical problem. Following is the problem statement:

There are n people standing in a circle waiting to be executed. The counting out begins at some point in the circle and proceeds around the circle in a fixed direction. In each step, a certain number of people are skipped and the next person is executed. The elimination proceeds around the circle (which is becoming smaller and smaller as the executed people are removed), until only the last person remains, who is given freedom. Given the total number of person n and a number k which indicates that k-1 persons are skipped and the kth person is killed in a circle. The task is to choose the place in the initial circle so that you are the last one remaining and so survive.
For example, if n = 5 and k = 2, then the safe position is 3. Firstly, the person at position 2 is killed, then the person at position 4 is killed, then the person at position 1 is killed. Finally, the person at position 5 is killed. So the person at position 3 survives.
If n = 7 and k = 3, then the safe position is 4. The persons at positions 3, 6, 2, 7, 5, and 1 are killed in order, and the person at position 4 survives.

*/

/* f(n,k) = (f(n-1, k) + k)%n */
/*
func josephus(n : Int, k : Int) -> Int{
    if n == 1{
        return 0
    }
    return (josephus(n: n-1, k: k) + k) % n
}

josephus(n: 5, k: 3)
*/

/*
// execution by dry run (recursive way)
josephus(n: 5, k: 3) ==> 3
|
(josephus(n: 4, k: 3) + 3) % 5  ==> 3
| ( 0 + 3) % 5 = 3%5 = 3
(josephus(n: 3, k: 3) + 3) % 4 ==> 0
|( 1 + 3) % 4 = 4%4 = 0
(josephus(n: 2, k: 3) + 3) % 3 ==> 1
| (1 + 3) % 3 => 4 % 3 = 1
(josephus(n: 1, k: 3) + 3) % 2 ==> 1
|
// (0 + 3) %2 => 3%2 = 1
//for n == 1, we return 0
*/


// Problem 10. Palindrom String problem.
// Palindrom String  - "abba", "aba", "acca", "racecar", "madam"
// Note : ulta seedha ek saman.
// even string : "abba", l can be move ahead r.
// odd string : "aba", l & r will point to same character.
/*
func isPalindrom(s: [String], l : Int, r : Int) -> Bool{
    if l >= r {
        return true
    }
    if s[l] != s[r]{
        return false
    }
    return isPalindrom(s: s, l: l+1, r: r-1)
}

let string: [String] = Array("madam").map { String($0) }
print("********* \(string) **********")
var l = 0
var r = string.count - 1

print("********* result : \(isPalindrom(s: string, l: l, r: r)) **********")
*/

/*
func isPalindromByloop(s: [String]) -> Bool{
    var l = 0
    var r = string.count - 1
    var isResultPalindrom = true
    for _ in s{
        if l >= r {
            return isResultPalindrom
        } else if s[l] != s[r]{
            isResultPalindrom = false
            return isResultPalindrom
        }
        l = l + 1
        r = r - 1
    }
    return isResultPalindrom
}

let string: [String] = Array("ba").map { String($0) }
print("********* \(string) **********")

var r = string.count - 1

print("********* result : \(isPalindromByloop(s: string)) **********")

let string2: [String] = Array("ara").map { ch in
    return String(ch)
}
print("********* result : \(string2)")
*/


// Problem 11. PowerSet/possible set/all sub sequences from a given string.
// Technique: "abc" is a given string, then

/*
          abc
      /         \
     a            ""
   /  \          /   \
  ab    a        b    ""
 /  \  / \      / \   / \
abc ab ac a    bc  b  c  ""

power set of abc = {"abc", "ab", "ac", "a", "bc", "b",  "c",  ""}
 
           abc
        /         \
i=0    a            ""
      /  \          /   \
i=1   a  ab         b    ""
     /  \  / \      / \   / \
i=2 abc ab ac a    bc  b  c  ""
 
 1. Base Condition/Termination Point.
 think for a empty string "", i == string.count, break/return with print "" (empty string).
 
 2. find sub problems.
 here i is increased by 1, we have 2 points , a & "", a is come from string[0] and "" string that should be pass from extra variable.
 
 2. genric solution.
 
for left side :-> f(string subsequence) = f (s, i+1, current + s[i])
for right side :-> f(string subsequence) = f (s, i+1, current)
*/

/*
func subsequencesOfString(string : [String], i : Int, currentString : String){
    
    if i == string.count{
        print(currentString)
        return
    }
     subsequencesOfString(string: string, i: i+1, currentString: currentString + string[i])
     subsequencesOfString(string: string, i: i+1, currentString: currentString)
}

let givenString =  Array("abc").map({ str in
    return String(str)
})

subsequencesOfString(string: givenString, i: 0, currentString: "")
 */

// Problem 12. swap a given string.
/*
func doSwaping(stringArray: inout [String])-> String{
    var resultedString = ""
    var l = 0
    var r = stringArray.count - 1
    for _ in stringArray{
        if l >= r {
            print("******** \(stringArray) **********")
            
            stringArray.forEach { str in
                resultedString += str
            }
            return resultedString
        } else {
            swapString(stringArray: &stringArray, l: l, r: r)
            l += 1
            r -= 1
        }
    }
    return resultedString
}

func swapString(stringArray: inout [String], l : Int, r : Int) {
    let temp = stringArray[l]
    stringArray[l] = stringArray[r]
    stringArray[r] = temp
}

let string = "ab"
var array = Array(string).map { ch in
    return String(ch)
}
print(array)
print("final \(doSwaping(stringArray: &array))")
*/

// Problem 13. print all permutaion of a given string.
/*
func permute(stringArray: inout [String], l : Int, r : Int){
    if l == r {
        print("*****\(stringArray)")
        return
    }
    for i in l...r {
        stringArray = swapString(stringArray: &stringArray, l: i, r: l)
        permute(stringArray: &stringArray, l: l+1, r: r)
        stringArray = swapString(stringArray: &stringArray, l: i, r: l)
    }
}
func swapString(stringArray: inout [String], l : Int, r : Int) -> [String]{
    let temp = stringArray[l]
    stringArray[l] = stringArray[r]
    stringArray[r] = temp
    return stringArray
}
var stringArray = Array("abc").map{ String($0)}
var l : Int = 0
var r : Int = stringArray.count - 1

permute(stringArray: &stringArray, l: l, r: r)
*/
//OutPUT :
/*
 *****["a", "b", "c"]
 *****["a", "c", "b"]
 *****["b", "a", "c"]
 *****["b", "c", "a"]
 *****["c", "b", "a"]
 *****["c", "a", "b"]
*/

// Time Complexity : O(n * n!)


