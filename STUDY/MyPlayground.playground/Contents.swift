import UIKit


//
//let closure : (Int, Int ) = { in
//    return $0 + $1
//}
//
//closure(2,4)


//2.
// 0, 1,1,2,3,5,8
// 0 + 1 => 1
//func fibonacciSeries() {
//    var a : Int = 0
//    var b : Int = 1
//    print("\(a), \(b)")
//    var c : Int = 0
//    for _ in 0..<20 {
//       c = a + b
//        a = b
//        b = c
//        print(c)
//    }
//
//}
//fibonacciSeries()


class A {
    
    var name:String
    
    init(name:String) {
        
        self.name = name
        
    }
    
}

class B:A {
    
    var id : String
    
    init(name:String, id : String){
        
        self.id = id
        
        super.init(name: name)
        
    }
    
    convenience init (id:String) {
        
        self.init(name: "unknown",id : "10")
        //another custom
        self.id = id
        
    }
}

//id : String/int
// addid's
protocol DoMyWork  {
    associatedtype T
    func addID<T>(param : T)
}

struct ABC : DoMyWork {
    typealias T = String
    
    
    func addID<T>(param: T) {
    }
}

func isCompleted() -> Bool{
    
    var a: Int?
    
    let group = DispatchGroup()
    group.enter()
    print("enter")
    // avoid deadlocks by not using .main queue here
    DispatchQueue.global(qos: .default).sync {
        a = 1
        print("Compledeted")
        group.leave()
    }
    group.wait()
    
    // wait ...
    
    print(a ?? 0) // you could also `return a` here
    return true
}

let number = "123.56"
let result = NumberFormatter().number(from: number)?.doubleValue
print(result ?? "")
