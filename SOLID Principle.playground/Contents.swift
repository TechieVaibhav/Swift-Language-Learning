import UIKit
import CoreGraphics

/*************** SOLID PRINCIPLE ***************/
/*
What is Solid Principle :

S stands for `Single Responsibilty Principle`.
                O : Open/Closed Principle.
                L : Liskov substitution principle.
                I : interface segregation principle.
                D : Dependency inversion principle.
 */

/*
 Need of Solid Principle : Solid principle is required to build a solid software where you find easy reusability, readability, sustainability (स्थिरता),loose coupling and much more.
 
 */

/*
 
Main Problem without Solid Principle can be : let suppose their is a change request generated in production code then you see if you change in one place that affects the multiple places due to tight coupling( class A and class B, there are 2 classes, so tight coupling means your code is written like your class A is never run without class B, because A is depends upon B, so there is no resuability possible, that is called tight coupling.)
 */

/*
 
Single Responsibility principle : One class should have only one responsibility or job.

General Example : Let suppose you r in a company, their are lots of job role, one person doing the testing job, one person doing the dev job, one person doing the product handling, so each person doing their job sepratly to run the organization properly.
 
In practice,
 */
/*
class DataHandler{
   private func fetchApiData()-> Data {
        return Data()
    }
    private func parseApiData(data : Data)-> [String : String] {
        return [:]
    }
    private func saveDataintoDB() {
        //sava db data
    }
    
    func handle(){
       let data = fetchApiData()
        parseApiData(data: data)
        saveDataintoDB()
    }
}

/*
 So in above example, DataHandler doing the 3 responsibility, that is not correct as per the Single responsibilty principle.
 */

// Now we will apply the Single responsibility principle here-

class NewDataHandler{
    var apiFetchHandler : FetchApiData?
    var parsingHandler : ParseApiData?
    var dbHandler: SaveDataintoDB?
    
    init(apiFetchHandler : FetchApiData, parsingHandler : ParseApiData, dbHandler: SaveDataintoDB) {
        self.apiFetchHandler = apiFetchHandler
        self.parsingHandler = parsingHandler
        self.dbHandler = dbHandler
    }
    
    func handle(){
        let data = apiFetchHandler?.fetchApiData()
        parsingHandler?.parseApiData(data: data)
        dbHandler?.saveDataintoDB()
    }
}

class FetchApiData{
    // will responsible for fetching data..
     func fetchApiData()-> Data {
         return Data()
     }
}
class ParseApiData{
    // will responsible for parsing data..
     func parseApiData(data : Data?)-> [String : String] {
        return [:]
    }
}
class SaveDataintoDB{
    // will responsible for saving data..
     func saveDataintoDB() {
        //sava db data
    }
}
 
*/

// 2nd Principle : Open/closed principle : class should be open for extension and closed for modification.
// You are using a web browser service into your app to extend your app feature but you can not change the code which worte inside the safari web browser.
/*
protocol Shape {
    func area() -> Int
}
class Reactangle : Shape{
   
    
    var height : Int = 0
    var width : Int = 0
    
    init(height : Int, width: Int){
        self.height = height
        self.width = width
    }
    func area() -> Int {
        return height * width
    }
}


class AreaCalculator{
    func calculateArea(shape : Shape) -> Int{
        shape.area()
    }
}

// now, let suppose client raise a new request, they want a new component that is circle and we want to calculate the area for cicrle, so

class Circle : Shape{
    var radius : Int = 0
    init(radius : Int){
        self.radius = radius
    }
    func area() -> Int {
        return radius * radius
    }
}

AreaCalculator().calculateArea(shape: Circle(radius: 10))

AreaCalculator().calculateArea(shape: Reactangle(height: 12, width: 12))

// So here we see when a new requirement is raised, the we will look on main code to adjust this requirement, so we can overcome this situtaion by Solid 2nd rule - open/closed principle -

*/

// 3rd Rule : Liskov subsitute principle : -
/*
class DBHandler{
    
    func  saveData(string : String){
        // save into DB
    }
}

class FilterDBHandler : DBHandler{
    
    override func saveData(string: String) {
        guard string.count > 5 else { return}
        super.saveData(string: string)
    }
}

// here , we break the liskov subsitute principle, because child is no more subsitute for it's parent class, here we are blocking the saving functionality.

// so if you want to achieve the same requirement then directly put the changes into main code.


class NewDBHandler{
    
    func  saveData(string : String, minChar : Int = 0){
        guard string.count > minChar else { return }
        // save into DB
    }
}
*/


/********************************************/

// Solution :

/*
protocol TapGesture{
    func singleTap()

}
protocol DoubleGesture{
    func doubleTap()
}

protocol longGesture{
    func longTap()
}
class UserView : TapGesture {
    func singleTap() {
        
    }
}

class LoginView : TapGesture,DoubleGesture, longGesture{
    func singleTap() {
        
    }
    func doubleTap() {
        
    }
    func longTap() {
        
    }
}
*/

// 5th principle: dependency inversion : Main Motive : decoupling the dependencies - high classes should not depends upon low level implementaion.
// In practice,

class Handler {
    var storage: Storage?
    
    init(storage : Storage){
        self.storage = storage
    }
    func save(string : String) {
        storage?.saveData(string: string)
    }
}

class FileManagerHandler : Storage{
    
    func saveData(string : String)  {
        // access fille
        // save file
        // file close
    }
    init() {
        
    }
}

class DBHandler : Storage{
    
    func saveData(string : String)  {
        // connection DB
        // save file
        // file close
    }
}

protocol Storage{
    
    func saveData(string : String)
}


Handler(storage: FileManagerHandler())


@objc protocol MyProtocol {
    @objc optional func anOptionalMethod()
    func aNotOptionalMethod()
}
 
class MyClass : MyProtocol {
    
    func aNotOptionalMethod() {
        
    }
}
