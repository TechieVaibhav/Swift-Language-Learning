import UIKit

// Jai Shree Ram
// Jai Mata Sita Ji Ki
// Jai Hanuman ji
// Jai Ho Ram Dharbar Ki
// Jai Vaibhav Lakhsmi Maa


/*
 // ************** Basic opertors **************

 //Operator : Prefix, Postfix, Unary, tersary oprator , one sided operator, closed range operator, half open range operator.
 // Prefix : -x
 let prefix = 1
 print(-prefix) // -1


 var postfix = 1
 postfix += 1
 print(postfix) // 2

 // Unary : ??, oprate over 2 operands a and b, get a if have value otherwise b as a fall of a value.

 var a : Int? = 10
 var b : Int? = 20
 var unaryOperator = a ?? b
 print(String(describing: unaryOperator))

 // tersary oprator : a, b , c oprands, operate over 3 operands.
 var tersaryOperand1 : Int = 10
 var tersaryOperand2 : Int = 20
 var tersaryOperand3 : Int = 28
 var tersaryOperator = (tersaryOperand1 > 12) ? tersaryOperand2 : tersaryOperand3
 print(tersaryOperator) //28

 // one sided operator : the end range should be defiend. terminate condition is required. one sidede range opertor helps to find out sub array.
 // Note : one side operator hepls to find out sub-array.

 var arrOfFruties = ["apple", "mango","pinaple", "grapes"]
 print(arrOfFruties[...2])
 print(arrOfFruties[1...2])
 print(arrOfFruties[1...])


 var number = "425.90"
 print(number.components(separatedBy: ".")) // ["425", "90"]
 print(number.split(separator: ".")) // ["425", "90"]

 // **********  End ********



 // ************** String and Characters **************


 // String : Direct subscript not posible with strings
 var str: String = "Hello world" // a collection of characters and str is a collection type.
 var character : Character = "a" // a character is a single letter.

 // startindex vs endindex - subscript to string
 // startindex - position of the first character.
 print( str[str.startIndex]) //H
 print( str[str.index(after: str.startIndex)]) //e

 // endIndex - more than 1 of it's last character position.

 print(str[str.index(before: str.endIndex)]) //d

 var multipline = """
 This is a paragrapgh
 how old are you\ni am just 18\nokay
 """
 print(multipline)

 //  This is a paragrapgh
 //  how old are you
 //  i am just 18
 //  okay

 // **********  End ********

 */

// ************** Value Type vs Reference Type **************
/*

 struct Match{
 var score : Int = 0
 mutating func updateScore() {
 self.score = self.score * 4
 }
 }

 var match = Match()
 let newCopyOfMatch = match
 match.score = 1
 match.updateScore()
 print("score is : \(match.score)") //score is : 4
 print("score is : \(newCopyOfMatch.score)") //score is : 0


 class MatchClass{
 var score : Int = 0
 func updateScore() {
 self.score = self.score * 4
 }
 }

 var matchClass = MatchClass()
 let matchHolder = matchClass
 let matchHolder2 = matchHolder
 matchClass.score = 1
 matchClass.updateScore()
 matchHolder.score = 100
 print("score is : \(matchClass.score)") //score is : 100
 print("score is : \(matchHolder.score)") //score is : 100
 print("score is : \(matchHolder2.score)") //score is : 100

 // **********  End ********

 */

//**********inout keyword***********

/*
 // inout keyword - mutate the variable, pass the reffrence in case of function argument either is struct or class.


 var incrementer = 10

 func increaseValueByInout(value : inout Int) {
 value += 6
 }
 increaseValueByInout(value: &incrementer) // pass the address of variable not the copy of value only
 print(incrementer) // 16


 // Problem statement : How to achive the reference behaviour by struct.

 struct ReferenceBased{
 var state = 0

 mutating func manageSateWithout(value : Int) {
 self.state = value
 }
 }


 func manageSateWith(stateRef : inout ReferenceBased) {
 stateRef.state = 100
 }

 var referenceBased = ReferenceBased()
 referenceBased.state = 90
 referenceBased.manageSateWithout(value: 120) //120
 print(referenceBased.state)

 manageSateWith(stateRef: &referenceBased) // now we pass only refernce/ same memopry address of struct.
 print(referenceBased.state) // 100

 // **********  End ********

 */

//********** Collection Type ***********

// Array, dictionary, string, sets
// Array -  Array is a collection of similar data types.

// ************** Array ************
/*
 let arrayOfString : [String] = ["abc", "bcg", "gggg"] // explicit way of defining the array.

 var emptyArray : [ String] = []
 emptyArray.append("ddd")
 emptyArray.append("abcd")
 print(emptyArray.count) // 2

 var anotherEmptyArray = [String]()
 anotherEmptyArray.append("ddd")
 anotherEmptyArray.append("abcd")
 print(anotherEmptyArray.count) // 2

 var arrayOfInt = Array<Int>()
 arrayOfInt.append(90)
 arrayOfInt.append(91)
 print(arrayOfInt.count) // 2


 // array of any

 let arrayOfAnay : [Any] = [11,11,23,44,"Hello", "Apple", "Developers"]
 print(arrayOfAnay.count) // 7 but not a good way to mix the things

 let arrayOfIntDuplicate : [Int] = [11,11] // duplicate array

 //itreation over the array
 anotherEmptyArray.forEach { obj in
 print(obj)
 }
 // ddd
 // abcd

 */
//************** End ************


//************** Dictionar ************

/*
 // Dictionar : dictionary is a unordered-collection of items(key value pairs).
 // Dictionar : key is unique.

 var dictionary = ["a" : 1, "b" : 2]
 print(dictionary.count) // 2 items
 print(dictionary.keys) // ["a", "b"]
 print(dictionary.values) // [1, 2]

 // update dictionary
 dictionary["b"] = 120
 dictionary["a"] = 123
 print(dictionary.values) // [120, 123]

 // update with nil
 dictionary["a"] = nil
 print(dictionary.values) // [120] only found one value after seting nil in respect to a key.

 var dictionarOfIntkey : [Int:Int] = [1:1,2:2,3:3]
 print(dictionarOfIntkey)

 for (index, value) in dictionary.enumerated(){
 print("index is : \(index) and value : \(value)")
 }
 //index is : 0 and value : (key: "b", value: 120)

 for (key, value) in dictionary{
 print("key is : \(key) and value : \(value)")
 }
 //key is : b and value : 120

 // ************** End ************
 */

//************** Set ************

/*
 // Set : set is a unordered collection of items.
 // Set : ensure no duplicate items can be come-in-set.

 var aSet : Set = [1,2,3,3,4,4]
 print(aSet) //[4, 1, 3, 2] // no duplicate item is allowed.


 //     var aMixSet : Set<Any> = [1,2,3,3,4,4, "Hello", "world"] as [Any]
 //     print(aMixSet) // a mix set is not possible in swift like array.


 //operations in set
 aSet = aSet.union([90,1990])
 print(aSet) //[2, 3, 1, 4, 90, 1990]
 aSet.insert(78)
 print(aSet)//[90, 78, 1, 3, 1990, 4, 2]
 print(aSet.isDisjoint(with: [90,1990])) //false
 print(aSet.isDisjoint(with: [78])) //false
 let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
 let visitors = ["Marcia", "Nathaniel", "Olivia"]
 print(employees.isDisjoint(with: visitors))// Prints "true"

 //   ************** End ************

 */

//****** Control flow Statement ******

// Continue, fallthrough, break
// Continue - loop iteration cycle can be re-continue for a specific condition.


/*
 func continueExample() {
 for objval in 0..<3{
 if objval > 1{
 continue
 }
 print("**objval *** \(objval)")
 }
 }
 continueExample()
 */

// output :
//**objval *** 0
//**objval *** 1
// note : when objval is reach to 1 then continue will re-continue the loop for futher itreation.


//fallthrough : fallthrough keyword helps to run just next case where fallthough is return, let see by exmple
/*
 func fallthroughExample(value : Int) {
 switch value {
 case 0:
 print("under case ** \(0)")
 fallthrough
 case 1:
 print("under case ** \(1)")
 fallthrough
 case 2:
 print("under case ** \(2)")

 case 3:
 print("under case ** \(3)")
 fallthrough
 default:
 print("under default ...")
 break
 }
 }
 fallthroughExample(value: 0)
 // Output:
 //under case ** 0
 //under case ** 1
 //under case ** 2
 */

/*
 // break : break keyword hepls to break the loop for a specific condition.

 for objval in 0..<3{
 if objval > 1{
 break
 }
 print("**objval *** \(objval)")
 }
 */
//****End **/


// ******2 Phase initializer******
/*
 // A situation where more than one variant is required, then 2 phase init can helps.
 // only available with `Value type` in swift.

 struct BuyRocket {
 var rocketPriceINR : Int

 init(rocketPriceINR: Int) {
 self.rocketPriceINR = rocketPriceINR
 }
 init(rocketPriceIn$ : Int) {
 let convertINR = rocketPriceIn$ * 70
 self.init(rocketPriceINR: convertINR)
 }
 }

 let indianRocketBuyer = BuyRocket(rocketPriceINR: 99999999)
 let usaRocketBuyer = BuyRocket(rocketPriceIn$: 99999)

 // Test 2phase init with enums

 enum My2PhaseEnum : Int{
 case zero = 0, one, two
 init(str : String) {
 switch str {
 case "0":
 self = .zero
 case "1":
 self = .one
 case "2":
 self = .two
 default:
 self = .zero
 }
 }

 init(value : Int) {
 self.init(str: String(value))
 }
 }

 My2PhaseEnum(value: 1)
 My2PhaseEnum(value: 2)

 /*
  class My2PhaseClass{
  var myvalue : Int
  init(newValue : Int) {
  self.myvalue = newValue
  }
  init(newValue : Double) {
  not possible by class becoz class uses convence init for this purpose
  }
  }
  */

 //**** End *******//

 */

//********** Initializer Types **********//
// designated Init -> default init.
// convience init -> used according to their convience, generally use to pass some default value,every convience init points to it's designated init.
// fatal init -> fallable init , can return nil if specific condition does not meet, if only fallable init is present in class then it's convience init also with fallable - init?(name : String), convenience init?(name : String)
/*
 struct MyDefaultStruct {
 var name : String
 var address : String
 var phoneNumber : String
 }
 // note in struct , default init is present there.

 MyDefaultStruct(name: "vaibhav", address: "Home", phoneNumber: "123579")


 struct MyDefaultStructWithConvience {
 var name : String = "vaibhav"
 var address : String
 var phoneNumber : String

 init(name : String,
 address : String,
 phoneNumber : String) {
 self.name = name
 self.address =  address
 self.phoneNumber = phoneNumber
 }

 /*
  convenience init() {
  // convenience init not possible in struct, only available with classes.
  }
  */

 // fallable init : init can be fail for a specific condition if not meet.
 init?(name : String){
 if name.isEmpty {
 return nil
 }
 self.name = name
 self.address =  "ddress"
 self.phoneNumber = "phoneNumber"
 }
 }

 MyDefaultStructWithConvience(name: "Sharma", address: "abc", phoneNumber: "145151")

 class InitExampleClass {
 var name = "Vaibhav"
 init(name: String) {
 self.name = name
 }
 convenience init() {
 self.init(name: "Sharma")
 self.name = "Vaibhav Override"
 }
 }

 let exampleClassOBJ = InitExampleClass(name: "Sharma")
 print(exampleClassOBJ.name)//Sharma

 let exampleClassOBJConvience = InitExampleClass()
 print(exampleClassOBJConvience.name) //Vaibhav Override

 class A{
 init(){
 print("A is called")
 }
 }
 class B : A{

 }

 B() //A is called

 class C{
 init(){
 print("C is called")
 }
 }
 class D : C{
 override init() {
 print("D is called")
 }
 }
 D()

 // D is called
 // C is called

 class E{
 init(){
 print("E is called")
 }
 }
 class F : E{
 override init() {
 print("F is called")
 }
 /*
  //'init()' has already been overridden, so convenience init is not possible.
  convenience init() {
  self.init()
  }
  */
 /*
  //'init()' has already been overridden, so fallable init is not possible.
  init?() {

  }
  */
 }

 F()
 //F is called
 //E is called

 //**** End *******//

 */

//********** Optionals **********//
/*
 //Optional => optional is a enum, which has 2 cases some value or none.
 var normalVariable  : String
 var implicitVariable  : String! // value can not be nil
 var optionalVariable  : String? // value can be nil

 normalVariable = "Vaibhav"
 implicitVariable = "Vaibhav"
 optionalVariable = "Vaibhav"

 // can not assign optional to normal variable.
 //normalVariable = optionalVariable

 print(normalVariable) // Vaibhav
 print(implicitVariable) //Optional("Vaibhav")
 print(implicitVariable) // Optional("Vaibhav")

 //**** End *******//

 */

//********** Optional Unwraping **********//
/*
 // Optional Unwraping : unwraped the value from optionals, unwraped the chips from packet.
 // guard let and if let, 2 ways for unwraping.
 // if let vs guard let - in if let, a piramid structure is created, but in guard let not pyramid found.
 //guard let improves the code readability.

 func unwrapingIFLETExample(a : Int?, b : Int?, c : Int?) {
 if let a = a {
 if let b = b {
 if let c = c {

 } else{
 print("c is nil")
 }
 } else {
 print("b is nil")
 }
 } else {
 print("a is nil")
 }
 }

 func unwrapingGuardLETExample(a : Int?, b : Int?, c : Int?) {
 guard let a = a  else {
 print("a is nil")
 return
 }
 guard let b = b  else {  print("b is nil")
 return
 }
 guard let c = c  else { print("c is nil")
 return
 }

 }

 //**** End *******//

 */

//********** Optional Chaining **********//
/*
 //Optional Chaining - a chain of optionals.
 // if any one reference is nil, then entire chain is failed.
 // the resulted value of optional chaning is also optional.

 class OptionalA{
 var optionalB : OptionalB?
 }
 class OptionalB {
 var optionalC : OptionalC?
 }
 class OptionalC {
 var targetValue = 10
 }

 OptionalA().optionalB?.optionalC?.targetValue // nil

 //**** End *******//

 */


//********** Call By Value vs Call by Reference **********//
/*
 var callByReference : Int = 0

 func updateValueOfRefrenceBasedVariable(value : inout Int) {
 value += 100
 }

 func updateValueOfValueBasedVariable(value : Int) {
 print("***\(value * 2)***")
 }
 updateValueOfRefrenceBasedVariable(value: &callByReference) //***200***//
 updateValueOfValueBasedVariable(value: callByReference) // 100 //
 print(callByReference) // 100 //
 //**** End *******//
 */

//********** class vs struct **********//
// class : classes are refernce type & class take place inside heap memory which is calculated at run time.
// struct : struct are value type & struct take place inside stack memory which is calculated at compile time.
// class : classes should be used if you want to pass reference from one place to another place and folow-up the changes otherwise struct is a good way.
// no of stored references = no of retain counts.
// class is supporting inheritance but struct is not, in struct, we need protocol for inheritance purpose.
// struct is thread safe but classes are not, shared reference of struct makes a seprate copy so if you do changes in copy then it will not impact over orignal struct resource.


//********** Closure **********//
/*
 // Closure : Closure is a self contain of block of statements/information. closures are reference based, generally using Closure to get the call back from a parlel opertions like api calling , then to get pared data we can get it by using Closure.

 // In swift- functions are first class citizens , that mean you can store functions into a variables for future use.

 func additionOfTwo(firstNumber: Int, secondNumber : Int) -> Int{
 return firstNumber + secondNumber
 }
 let additionOfTwoNumberFunc = additionOfTwo(firstNumber: 10, secondNumber: 20)
 print(additionOfTwoNumberFunc) // 30 //

 typealias Addition = (Int, Int) -> Int

 let additionClosure: Addition = { (_firstNumber : Int, _secondNumber : Int)-> Int  in

 return (_firstNumber + _secondNumber)
 }

 print(additionClosure(10,20)) // 30 //

 let multiplyClosuer : ( Int, Int) -> Int = {
 return $0 * $1
 }
 print(multiplyClosuer(10,20)) // 200 //

 typealias singleParamterClosuer = (String) -> Void
 typealias twoParamterClosuer = (String, Int) -> Void
 typealias twoParamterClosuerWithReturnString = (String, Int) -> String

 // closure type - trailing closure, autoclosure closure

 // trailing closure - if you pass closure as a last argument of a function, then it is a trailing closure, improve code readability.

 typealias trailingClosureType =  (Int, Int)-> Int
 func trailingClosureExample(trailingClosure: trailingClosureType) {
 print("func calling..")
 let result = trailingClosure(10, 20)
 print(result) // 30 //
 }

 trailingClosureExample { firstNumber, secondNumber in
 return firstNumber + secondNumber // trailing closure body
 }
 typealias TarilingListType = (String)->String

 func trailingClosureExample1(closure : TarilingListType) {
 let result = closure("pass closure argument excepted String")
 print(result)
 }
 trailingClosureExample1 { exceptString in
 return exceptString + "\n additional comments"
 }
 // pass closure argument excepted String //
 // additional comments //

 typealias SingleArgumnetTrailingClosure = (String) -> Void

 func trailingClosureExample2(trailingClosure : SingleArgumnetTrailingClosure) {
 trailingClosure("You are look at me - Single Argument")
 }
 trailingClosureExample2 { singleArgument in
 print("singleArgument is \(singleArgument)")
 }
 //singleArgument is You are look at me - Single Argument //


 //autoclosure closure : @autoclosure is a keyword, which ommits the {} curly braces, unlike normal closure in autoclosure you can not pass arguments, only return type is excepted.

 // autoclosure closure - excepting zero argument and return only a single value.

 func autoClosureExample(closure : @autoclosure() -> String) {
 let resultedValue = closure()
 print(resultedValue)
 }
 autoClosureExample(closure: "I have pass as a agrument@")
 //I have pass as a agrument@ //

 func printAfterEvaluating(closure: @autoclosure () -> String) {
 let result = closure()
 print(result)
 }

 let name = "Jane"
 let age = 25

 printAfterEvaluating(closure: "My name is \(name) and I am \(age) years old.")


 //**** End *******//

 */

//********** escaping vs non-escaping closures **********//
/*
 //escape - mean `Hide From Action Things`
 // Non -escaping closure : `default` closure is a non-escaping closure.
 // escape and non-escape both are comipler terms.
 //escapingclosure - all those closure which are call after the function return known as escaping closures,becoz compiler maintains the extra memory for escaping closures.

 func nonEscapeCllsoure(closure : ()-> Void) {
 closure()
 return
 }

 func escapingClosure(closure : @escaping ()-> Void) {
 print("#func calling...")
 DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:{
 closure()

 })
 return
 }

 escapingClosure {
 print("#closure calling...")
 }

 //#func calling...
 //#closure calling...

 func escapingClosureExample2(closure : @escaping ()-> Void) {
 print("#func calling...")
 DispatchQueue.main.async {
 closure()
 }
 return
 }

 escapingClosureExample2 {
 print("with any block, clsoure marked with @escaping")
 }

 //#func calling...
 //with any block, clsoure marked with @escaping

 //**** End *******//

 */

//********** capture list vs non-capture list in closure **********//
/*
 //capture list - capture list is used to prevent the strong reference/retain cycle.
 // without capture list - strong cycle can be created with a shared variable.

 var count = 0

 let incrementer = {
 count += 1

 }

 incrementer()
 print("counter is \(count)") // counter is 1 //
 incrementer()
 print("counter is \(count)") // counter is 2 //

 // count - changes added into orignal resource.
 // prevent the retain cycle by use of capturelist.
 // with `in` keyword
 // only value is captured.
 var languageCode = "objective-c"

 let language = { [languageCode] in

 print( "languageCode **** \(languageCode)") // seprate copy is created.
 }
 languageCode = "swift"
 language() // languageCode **** objective-c
 languageCode = "swift"
 language() //languageCode **** objective-c

 // without `in` keyword.
 // orignal recource will change.
 var oldLanguageCode = "objective-c"

 let checkLanguage = { [oldLanguageCode]

 print( "languageCode **** \(oldLanguageCode)") // seprate copy is created.
 }
 oldLanguageCode = "swift"
 checkLanguage() // languageCode **** swift
 oldLanguageCode = "12345"
 checkLanguage() //languageCode **** 12345


 class CaptureList {
 // Declare
 var closure : (()->Void)?
 var value = 10
 init() {
 closure = { [weak self] in
 if let strongSelf = self {
 print(" value is - \(strongSelf.value)")
 }
 }
 }
 deinit{
 print("** deint calling...**")
 }
 }

 var objCaptureList : CaptureList? = CaptureList()
 objCaptureList?.closure?()
 objCaptureList = nil

 // 10
 // ** deint calling...**

 //**** End *******//

 */

//******Enum********//
/*
 //Enum = enumeration, enum is group of related values.
 //like - sunday, monday, tuesday -- values which are related.
 //like - jan, feb, march -- values which are related.
 // raw value - user defined value, to add the rawvalue, rawtype should be defined first.
 //CaseIterable -  to perform the iteration over the enum cases.
 // hashValue - a logic index value.

 enum MonthNameEnum{
 case jan,feb,march
 }

 enum WeekNameEnum : Int{
 case sun = 0,monday,tuesday
 }

 let weekend = WeekNameEnum.sun
 print(weekend) // sun //
 print(weekend.hashValue) // logic index

 enum FriutNameEnum : Int,CaseIterable{
 case apple = 0,mango,kiwi
 }

 for obj in FriutNameEnum.allCases{
 print(obj)
 }
 /*
  apple
  mango
  kiwi
  */

 // *** Associated values **** //
 // Associated values - Associate with enum cases.

 enum SocialMediaFriends{
 case facebook(follower : Int)
 case instagram(follower : Int)
 }
 let socialMediaFriends = SocialMediaFriends.instagram(follower: 10)

 switch socialMediaFriends{
 case .facebook(let follower) :
 print("facebook \(follower)")
 case .instagram(let follower) :
 print("instagram \(follower)")
 }

 // instagram 10 //

 // *** Recursive Enum **** //

 // `indirect` keyword is used to marked enum is a recursive enum.
 //Recurtion - recurtion is a technique where a func call itself again and again to eveluate the result.
 //enum --> same type of enum --> asscoated with it's case value --> a moment is come or termination condition is meet to grab the value to perform the desired task.
 // best example -> arthmetic operation.

 indirect enum ArthmeticOperation{
 case termination(value : Int)
 case addition(leftValue : ArthmeticOperation , rightValue : ArthmeticOperation)
 }

 func eveluateValue(arthmeticexpression : ArthmeticOperation) -> Int {
 switch arthmeticexpression{
 case .termination(let value):
 return value
 case .addition(let leftValue, let rightValue):
 return eveluateValue(arthmeticexpression: leftValue) + eveluateValue(arthmeticexpression: rightValue)
 }
 }

 let letValue : ArthmeticOperation = ArthmeticOperation.termination(value: 99)
 let rightValue : ArthmeticOperation = ArthmeticOperation.termination(value: 120)

 let addition = ArthmeticOperation.addition(leftValue: letValue, rightValue: rightValue)
 let finalresult = eveluateValue(arthmeticexpression: addition)
 print(finalresult) // 219 //

 // *** frozen and non-frozen enum **** //
 // Optional enum in swift sdk is a frozen enum.
 // bydefault all enums are non-frozen enum, can be change as per requiremnt or convience.
 @frozen enum FixedScopeEnum : Int{
 case fixed = 0
 case final = 1
 }

 // *** @unknown default in enum case **** //
 //@unknown default - tell us when a new case is added into the enum.
 enum LapTopNameEnum {
 case apple16
 case apple17
 case apple18
 }
 let lapTopNameEnum = LapTopNameEnum.apple16

 switch  lapTopNameEnum{
 case .apple16:
 print("apple16 inch")
 case .apple17:
 print("new laptop added")
 @unknown default:
 print("new laptop added")
 }

 //** Ending **//

 */

// ** Property ***//
/*
 // stored property - store the value,
 // computed property - compute the result on run time, decalre with var instaed of let., becoz they start work on run time.

 struct PropertyCalculation{
 var score = 10 // stored property
 // computed
 var comuptedProperty: Int{
 get{
 return score
 } set{
 score = newValue * 10
 }
 }
 }

 print(PropertyCalculation().comuptedProperty) // 10
 // ** END ** //

 */

// **** subscript *** //
/*
 // instaed of calling any function or property, direct appled over the target variable.

 struct AllShortcutWay {
 var fuits = ["Apple", "kiwi", "Mango"]

 subscript(index : Int) -> String{
 return fuits[index]
 }
 }
 let allShortcutWay = AllShortcutWay()
 // traditional way
 allShortcutWay.fuits[0] // Apple
 // subscript way
 allShortcutWay[0] // Apple
 */

// **** Deinit *** //
/*
 // deinit only works with class/actor

 class Testingdeint{
 var value : Int?
 required init(value : Int) {
 self.value = value
 }
 deinit {
 print("calling")
 }
 }
 var testingdeint :Testingdeint?  = Testingdeint(value: 10)
 var testingdeint1 = testingdeint
 var testingdeint2 = testingdeint

 // no of shared ref = retain count
 // untill retain count becomes zero, no deinit will call, make sure all ref are set to nil.

 testingdeint = nil
 testingdeint1 = nil
 testingdeint2 = nil

 // **** End *** //

 */

// **** Error Handling *** //
/*
 //do try catch
 // error protocol

 enum AllTypeError : Error {
 case errInvalidKey
 case invalidUrl
 }

 func handleAction() throws -> Int {
 throw AllTypeError.errInvalidKey
 }

 do {
 try handleAction()
 } catch AllTypeError.errInvalidKey{
 print("errInvalidKey") //errInvalidKey//
 } catch AllTypeError.invalidUrl {
 print("invalidUrl")
 }

 // ** Ending ** //

 */

// ** Protocol **//
/*
 // decipilin of code/ set of rules
 // add two numbers through protocol.

 protocol AddTwoNumber : Numeric{

 }

 func addTwoNumberByProtocol<T : Numeric>(num1 : T , num2 : T) -> T {
 return num1 + num2
 }
 addTwoNumberByProtocol(num1: 20, num2: 30) // 50 //


 // ** Generic Protocol ** //
 // can not direct instantiate.
 // associatedtype - generic protocol
 // typealias comes into adopted type of generic protocol

 protocol GenericProtocol {
 associatedtype T
 mutating func addItem(item : T)
 func count() -> T
 }
 struct GenericType : GenericProtocol {

 typealias T = Int
 var items = [Int]()
 mutating func addItem(item: Int) {
 items.append(item)
 }
 func count() -> Int {
 return items.count
 }
 }

 var genericType = GenericType()
 genericType.addItem(item: 10)
 genericType.addItem(item: 20)
 genericType.count() // 2 //

 // ** Ending ** //

 */

// ** Touples ** //
/*
 // group of data/information.
 // named touple and unnamed touple
 let touple = (4,5,6,7)
 print(touple.0) // 4 //

 let namedTouple = (x:4,y:5,z:6,a:7)
 print(namedTouple.x) // 4 //

 // swap 2 values by touples
 var swapValueA = 10
 var swapValueB = 20
 (swapValueB, swapValueA) = (swapValueA, swapValueB)
 print(swapValueA) // 20 //
 print(swapValueB) // 10 //

 // ** Ending ** //

 */

// ** async await  ** //
/*
 // async function - async function are execute on seprade threads, async func are not blocking the main thread. async focus only on function start and stop.
 //async function - can be called from another async function, not inside the normal function.
 // example - you are downloading a file in background meanwhile you are using the app.
 // async await - await means waiting, `await` keyword pause the current context for that async function, in simple, await is waiting for the function execution, either function return a value or throw an exception.
 //
 //async await - supports the concurrency concept.
 //
 // concurrency - concurrency means a concurrent environment, concurrency focus on the multiple task execution at a same time.focus on how function is execute.
 // concurrency example - a multicore CPU or dula core sysytem.
 // concurrency offer us multiple execution context.
 // using both of them, we can improve the application performance specially for long runing task.



 func f1() async -> Int {
 try? await Task.sleep(for: .seconds(5))
 return 10
 }

 func f2() async -> Int {
 return 20
 }

 func f3( inputNum1 : Int, inputNum2: Int) async -> Int {
 return inputNum1 + inputNum2
 }

 func evaluateTheResult() async -> Int {

 let result1 =  await f1()
 let result2 =  await f2()
 let finalResult = await f3(inputNum1: result1, inputNum2: result2)
 return finalResult
 }

 Task.detached{
 print("The Final output :-  \(await evaluateTheResult())")
 }


 func testingF1() async -> Int {
 try? await Task.sleep(for: .seconds(5))
 let result = await fetchData()
 print("**calllll....*")
 return result
 }

 func fetchData() async -> Int {
 return 10
 }
 func normalFunction() -> String {
 return "Hey i am normal function!!"
 }

 Task.detached{
 print("The Final output :-  \(await testingF1())")

 }

 Task.detached{
 print("The normal output :-  \(normalFunction())")
 }
 // **Ending** //

 */

// ** DispatchQueue.main.async  ** //
/*
 // DispatchQueue.main.async have 2 points of meaning-
 // DispatchQueue.main - main queue to update the UI elements from background thread.
 // async {} -  async function which is not waiting for the previous task to start the new task. no waiting for respected tasks.


 DispatchQueue.main.async {
 DispatchQueue.main.asyncAfter(deadline: .now() + 2){
 print("asyncAfter 2")
 }
 print("hey I am free to call ")
 }
 // **Ending** //

 */

// ** Deadlock  ** //
/*
 func deadlockSituation() {
 //DispatchQueue.main - main queue which is design to perform UI updates.
 // DispatchQueue.main - main is a serial thread
 // force main thread (serial thread) to run as synchronously, deadlock created.
 // sync {} block the main thread.
 DispatchQueue.main.sync {
 print("Perfom code sync")
 }
 }


 func deadlockSituationWillNotHappen() {
 // Serail Queue
 let serialQueue = DispatchQueue(label: "My Serial Queue")

 serialQueue.sync {
 print("Higher priority task perform synchronously")
 }
 }


 //deadlockSituationWillNotHappen() //Higher priority task perform synchronously//

 func deadlockSituationWillHappen() {
 // Serail Queue
 let serialQueue = DispatchQueue(label: "My Serial Queue")

 serialQueue.sync {
 print("Higher priority task perform synchronously")
 serialQueue.sync {
 print("force sync to perform synchronously")
 }
 }
 }
 //deadlockSituationWillHappen() // deadlock occured, forcing the sync to perform like sync //

 func deadlockSituationTest() {
 // Serail Queue
 let serialQueue = DispatchQueue(label: "My Serial Queue")

 serialQueue.sync {
 print("Higher priority task perform synchronously")
 serialQueue.async {
 print("force sync to perform synchronously")
 }
 }
 }
 //deadlockSituationTest() // no deadlock created, force sync to perform synchronously //

 func deadlockSituationTest2() {
 // Serail Queue
 let serialQueue = DispatchQueue(label: "My Serial Queue")

 serialQueue.async {
 print("Higher priority task perform synchronously")
 serialQueue.async {
 print("force sync to perform synchronously")
 }
 }
 }
 // deadlockSituationTest2() // there is no deadlock. //

 func deadlockSituationTest3() {
 // Serail Queue
 let serialQueue = DispatchQueue(label: "My Serial Queue")

 serialQueue.async {
 print("async")
 serialQueue.sync{
 print("sync")
 }
 }
 }
 // deadlockSituationTest3() // deadlock creadted.//

 func deadlockSituationTest4() {
 // Serail Queue
 let serialQueue = DispatchQueue(label: "My Serial Queue")
 let anotherSearialQueue = DispatchQueue(label: "My Serial Queue2")

 serialQueue.async {
 print("async")
 anotherSearialQueue.sync{
 print("sync")
 }
 }

 serialQueue.sync {
 print("async")
 anotherSearialQueue.sync{
 print("sync")
 }
 }
 }
 // deadlockSituationTest4() // no deadlock, one queue is behave async and second sync //

 func deadlockSituationTest5() {
 DispatchQueue.main.async {
 print("step 1")
 DispatchQueue.main.async {
 print("step 2")
 }
 }
 }
 //deadlockSituationTest5() // run perfectly

 func deadlockSituationTest6() {
 DispatchQueue.main.async {
 print("step 1")
 DispatchQueue.main.sync{
 print("step 2")
 }
 }
 }
 //deadlockSituationTest6() // step 1 , deadlock created.//


 func deadlockSituationTest7() {
 DispatchQueue.main.sync {
 print("step 1")
 DispatchQueue.main.async{
 print("step 2")
 }
 }
 }

 //deadlockSituationTest7() //deadlock created.//

 // ****Ending*** //

 */

// *** Extension ** //
// behave like a wrapper, add extension over Int
// extension are more like to extend the functionality for existing type.
// stored property are not allowed in  extensions(and `init` not allwoed if extentend the existing type like 'Int', `string`).
// convience init is allowed in extensions.
/*

 extension Int {
 //  custom computed property
 var score: Int {
 get {
 return self * 10
 }
 }

 func myCustomFunction() -> Int{
 return self * 120
 }

 }

 print(11.score) // 110 //
 print(11.myCustomFunction()) // 1320 //

 class ExtensionTestingWithConvienceInit{
 var name : String
 var age : Int

 init(name: String, age: Int) {
 self.name = name
 self.age = age
 }
 }
 extension ExtensionTestingWithConvienceInit{
 convenience init?(age : Int) {
 if age < 18{
 return nil
 }
 self.init(name: "Vaibhav", age: age)
 }
 }

 // in struct - convenience init are not allowed.

 // Property wrapper
 @propertyWrapper
 struct EmailValidator {
 private var _value : String?

 var wrappedValue : String{
 get {
 isValidEmail() ? _value! : ""
 }
 set{
 _value = newValue
 }
 }

 init(wrappedValue: String) {
 self.wrappedValue = wrappedValue
 }

 func isValidEmail() -> Bool {
 if let value =  _value, value.count > 5{
 return true
 }
 return false
 }
 }

 class User{
 @EmailValidator var email : String
 var pass: String
 init(email: String, pass: String) {
 self.email = email
 self.pass = pass
 }
 }
 let user = User(email:"123456", pass: "")
 print(user.email)

 */
/*
 func alphabetCount(inputstring : String) -> Int{

 var lowerCaseCount = 0
 var upperCaseCount = 0

 for char in inputstring{
 if char.isUppercase{
 upperCaseCount += 1
 } else if char.isLowercase{
 lowerCaseCount += 1
 }
 }
 if upperCaseCount == lowerCaseCount{
 return 0
 } else if upperCaseCount > lowerCaseCount {
 return 1
 } else {
 return 2
 }
 }

 alphabetCount(inputstring: "AAAAAAbbb")
 */

//// Selection sort
//func sortArray(arr : inout [Int]) {
//    var length = arr.count
//    for i in 0..<length-1{
//        for j in (i+1)..<length{
//            if arr[i] > arr[j]{
//                var temp = arr[i]
//                arr[i] = arr[j]
//                arr[j] = temp
//            }
//        }
//    }
//    print("final array : \(arr)")
//}
//var arr = [1,89,0,12,3,5,1,2,1,2,2,2,33,3,3,3,4,4,4]
//sortArray(arr: &arr)


//== vs ===

struct A : Equatable{
    var x = 10
}
var a = A()
var b = A()

if a == b {
    print("same")
}
