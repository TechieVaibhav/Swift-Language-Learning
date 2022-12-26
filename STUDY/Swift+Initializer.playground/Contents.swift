import UIKit

/* SWift Initializer Rules */
/* Designated Init / User Defind */
/* Convenience Init Method*/
/* Failable Init */

//Example 1
/*
 struct Person {
 var age : Int
 var name : String
 var address: String
 }
 
 //Going to create instance for struct Person
 let person = Person(age: 20, name: "DJ", address: "203/4 South Road")
 person.name
 person.age
 person.address
 
 /* We can see here swift provide a default init method to init their attributes or stored properties.  */
 */


/*
 
 /******* Consider same example with enum ********/
 enum Person : String{
 case age
 case name
 case address
 }
 
 let personObj = Person(rawValue: "")
 /* Row Valkue init coming by default */
 
 */


/*
 /******* Consider same example with class ********/
 class Person {
 var age : Int
 var name : String
 var address: String
 }
 
 let personObj = Person()
 /* There is no default init because Classes are reference types (one class can inherit another class, so let suppose there are 2 classes ,each class have 3 attributes or properties, according to default init 3 + 3 = 6 propeties should be shown in default init for a child class , that can make a confusion because parent class can have another data logic.)*/
 
 */


//Example 2
/*
 struct Person {
 var age : Int
 var name : String
 var address: String
 //Custom initializer
 init( age : Int) {
 self.age =  age
 }
 }
 
 //Going to create instance for struct Person
 let person = Person(age: 23)
 person.name
 person.age
 person.address
 
 /* Here we are getting init error because user added a init with only one param to age param, so remains param can not initialized and  complier does not provide a default init to all remaining properties */
 
 */

//Example 3

/*
 
 /* designated Init or User Defined Init*/
 class Item {
 var name : String?
 var quantity : Int?
 var price : Int?
 var totalPrice : Int?
 
 init(name : String?, quantity : Int, price : Int) {
 
 self.name  = name
 self.quantity = quantity
 self.price = price
 self.totalPrice  = (quantity * price)
 }
 }
 
 let itemObj = Item(name: "Iphone", quantity: 5, price: 60000)
 itemObj.name
 itemObj.totalPrice
 
 */

//Example 4
/*
 /* Convenience Init */
 
 class Item{
 var name : String
 var quantity : Int?
 var price : Int?
 var totalPrice : Int?
 
 init(name : String, quantity : Int, price : Int) {
 
 self.name  = name
 self.quantity = quantity
 self.price = price
 self.totalPrice  = (quantity * price)
 }
 //a Convenience init always call same class designated init
 convenience init(name : String) {
 self.init(name : name, quantity : 1, price : 60000)
 self.name = "IphoneX"
 }
 
 //a Convenience init always call same class designated init
 convenience init(price : Int) {
 self.init(name : "IphoneX", quantity : 1, price : price)
 }
 
 //a Convenience init can call another convenience init
 convenience init() {
 self.init(price : 50000)
 }
 }
 
 let itemObj = Item()
 itemObj.name
 itemObj.totalPrice
 
 */

//Example 5

/*
 
 /* Parent Child Relation  */
 
 class Mobile {
 var mobilePrice: Int?
 
 init(mobilePrice: Int?) {
 self.mobilePrice = mobilePrice
 }
 convenience init(mp : Int) {
 self.init(mobilePrice: 100)
 }
 }
 
 class Item : Mobile{
 var name : String
 var quantity : Int?
 var price : Int?
 var totalPrice : Int?
 
 init(name : String, quantity : Int, price : Int) {
 //all stored properties init first
 self.name  = name
 self.quantity = quantity
 self.price = price
 self.totalPrice  = (quantity * price)
 //initalize all stored properties then call parent class designated init
 //a designated init always call parent class designated init, it can not be call to super class Convenience init
 super.init(mobilePrice: totalPrice)
 
 // Now we can perform any custom setup with properties
 }
 
 //a Convenience init always call same class designated init
 convenience init(name : String) {
 self.init(name : name, quantity : 1, price : 60000)
 self.name = "IphoneX"
 }
 
 //a Convenience init always call same class designated init
 convenience init(price : Int) {
 self.init(name : "IphoneX", quantity : 1, price : price)
 }
 
 //a Convenience init can call another convenience init
 convenience init() {
 self.init(price : 50000)
 }
 }
 
 let itemObj = Item()
 itemObj.name
 itemObj.totalPrice
 itemObj.mobilePrice
 
 */


//Example 6


/* Failable Initializer */
/*
class Mobile {
    var mobilePrice: Int?
    
    init?(mobilePrice: Int?) {
        //suppose we have added a limitaion, price should be higher 120
        // so now we can control our init by failure init
        // if mobilePrice less than 120 then mobile class instance\object can not be created.
        if let mobilePrice = mobilePrice, mobilePrice < 120 {
            return nil
        }
        self.mobilePrice = mobilePrice
    }
    // Failable convenience init
    convenience init?(mp : Int) {
        self.init(mobilePrice: mp)
    }
}

let obj = Mobile(mp: 13) // instance not create.
obj?.mobilePrice // nil value returned. */

var a : Any? = 10

if let result = a as! Int?{
    print(result)
}
