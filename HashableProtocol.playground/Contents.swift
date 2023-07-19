import UIKit
/*
 Hashable Protocol
 when we need to abopt Hashable? - so when you are dealing with set or custom dictionary keys(key are custom objects), then you have to abopt the hasable protocols, because set and dictionary key's should be unique, to make it unique , swift uses a hashvalue.

 Note : if 2 objects are equal then their hash values also same , but if hash values are same , than might be the objects can differ.
            
 Note : never store the hash value, because hash value is generated on run time and can be change on runtime.

 Set and Dictionary keys -- does not have duplicate values unlike array, so hashvalue is used to make it unique by swift.
            */


struct SimpleStructure{
    var identifier : String
}

var array : [SimpleStructure] = [SimpleStructure(identifier: "abc"),
                                 SimpleStructure(identifier: "xyz")]

// No problem occurs with array, lets try with set

struct NewSimpleStructure : Hashable{
    var identifier : String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Self, rhs: Self) -> Bool{
        return lhs.identifier == rhs.identifier
    }
}



// So Set will throw warings to adopt the hasable protocol, adopt hashable , then it will run fine.

var aset = Set<NewSimpleStructure>()
aset.insert(NewSimpleStructure(identifier: "abc"))
aset.insert(NewSimpleStructure(identifier: "abc"))
//print(aset.count)

// So if we create  a set with system provided data type like as int or double, then compiler will not complain about to adobt the Hashable because they provide hashvalue by default, because Double already have Hashable protocol.
        
var aDoubleSet = Set<Double>()
aDoubleSet.insert(10.0)


class Student: Hashable{
   
    var name : String
    var id : Int
    
    init(name: String, id : Int) {
        self.name = name
        self.id = id
    }
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

let s1 = Student(name: "Raj", id: 1)
let s2 = Student(name: "Raju", id: 1)

print(s1.hashValue) // 8202175269249365470
print(s2.hashValue) // 5148841292464739704



//Note : hashvalue is depreacetd, now use the hashFunction to track the properties along with equatable function, so inside hash function, all properties should be a subset of == function properties tracker.

// Note : generally should avoid the hashable to compare the objects, always tring to compare objects by == operator.


if s1 == s2{
    print("same objects")
}


var dict = [Student: String]()
dict[Student(name: "Rajan", id: 121)] = "127"

print(dict)





