//
//  ContentView.swift
//  Codable
//
//  Created by Vaibhav Sharma on 01/05/24.
//

import SwiftUI
struct User : Codable {
    let firstName : String
    let lastName : String
}

struct NewUser: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    @State private var user = User(firstName: "vaibhav", lastName: "sharma")

    var body: some View {
        decodeJSONWithAnotherObject()
    }
}

func  decodeJSONWithAnotherObject() -> some View {
    Button("Decode JSON") {
        let input = """
           {
               "name": "Taylor Swift",
               "address": {
                   "street": "555, Taylor Swift Avenue",
                   "city": "Nashville"
               }
           }
           """
        let data = Data(input.utf8)
        let decoder = JSONDecoder()
        if let user = try? decoder.decode(NewUser.self, from: data) {
            print(user.address.street)
        }
    }
}

func jSONEncoder(user : User) -> some View {

    Button("save data") {
        let jsonEncoder = JSONEncoder()
        if let json = try? jsonEncoder.encode(user){
            print(json)
            let decoder = JSONDecoder()
            let result =  try! decoder.decode(User.self, from: json)
            print(result)
        }
    }
}

#Preview {
    ContentView()
}
