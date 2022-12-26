//
//  Test45.swift
//  
//
//  Created by Vaibhav Sharma on 30/07/21.
//

import Foundation

//person -- name , id , imageUrl

// []

struct  Person {
    var name : String ?
    var id : String ?
    var imageUrl : String ?
}

class Observer <T> {
    var value : T
   
    func bind(value : T)  {
      // call the clouser
    }
}

class Repo {
    // network call
}
class ViewModel {
    var data : [Person]?
    var repo = Repo()
    func fetchData() -> {
        //repo.//
    }
    func getPerson (index: int) -> Person {
        
    }
}
