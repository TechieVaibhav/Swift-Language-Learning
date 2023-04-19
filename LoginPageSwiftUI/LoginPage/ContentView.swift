//
//  ContentView.swift
//  LoginPage
//
//  Created by Vaibhav Sharma on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userName: String = String()
    @State private var password: String = String()
    var body: some View {
        VStack{
            
            Text("Login")
                .font(.title)
                .foregroundColor(.black).padding()
            
            
            TextField("Username", text: $userName)
                .padding()
                .background(Color.gray)
                .cornerRadius(4)
                .padding()
            
            SecureField("password", text: $password)
                .padding()
                .background(Color.gray)
                .cornerRadius(4)
                .padding()
            
            
            Button {
                print("Tapped on button")
            } label: {
                Text("Login")
            }.font(.largeTitle)
                .foregroundColor(.red)
                .border(.yellow, width: 2)
                .cornerRadius(4)
                .disabled(userName.count < 4)
                .padding()
            
            
        }
        .border(.gray, width: 2)
        .background(Color.green)
        .cornerRadius(4.0)
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
