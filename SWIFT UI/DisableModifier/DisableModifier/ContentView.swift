//
//  ContentView.swift
//  DisableModifier
//
//  Created by Vaibhav Sharma on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userEmail = ""
    @State private var password = ""
    var disbaleForm : Bool{
        return (userEmail.count < 5 || password.count < 5)
    }
    var body: some View {
        Form{
            Section {
                TextField("User Email", text: $userEmail)
                TextField("User Password", text: $password)
            }
            Section {
                Button("Create Account") {
                    print("Create...")
                }.disabled(disbaleForm)
            }
        }
    }
}

#Preview {
    ContentView()
}
