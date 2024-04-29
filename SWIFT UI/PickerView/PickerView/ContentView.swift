//
//  ContentView.swift
//  PickerView
//
//  Created by Vaibhav Sharma on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Rajan", "Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        Form {
            Picker("Select Student:", selection: $selectedStudent) {
                //code
                ForEach(students,id: \.self){
                    Text($0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
