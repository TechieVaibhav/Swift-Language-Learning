//
//  ContentView.swift
//  TextFields
//
//  Created by Vaibhav Sharma on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var name : String = ""
    var body: some View {
        Form{
            TextField("Enter Your Name", text: $name)
            Text("your name is : \(name)")
            ForEach(0..<2){ item in
                Text("Row: \(item)")
            }
            ForEach(0..<2){
                Text("Row: \($0)")
            }
        }
    }

}

#Preview {
    ContentView()
}
