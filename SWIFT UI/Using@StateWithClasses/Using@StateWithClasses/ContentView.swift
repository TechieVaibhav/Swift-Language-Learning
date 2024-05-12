//
//  ContentView.swift
//  Using@StateWithClasses
//
//  Created by Vaibhav Sharma on 01/05/24.
//

import SwiftUI
import Observation

@Observable
class User {
    var fisrtname : String = ""
    var lastName : String = ""
}
struct ContentView: View {
    @State private var user = User()
    var body: some View {
        Text("Your name is \(user.fisrtname) and \(user.lastName)")
        VStack {
            TextField("enter fname to change", text: $user.fisrtname)
            TextField("enter lname to change", text: $user.lastName)
        }.padding(10)

    }
}


#Preview {
    ContentView()
}
