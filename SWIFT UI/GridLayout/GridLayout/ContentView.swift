//
//  ContentView.swift
//  GridLayout
//
//  Created by Vaibhav Sharma on 05/05/24.
//

import SwiftUI


struct ContentView: View {
    let gridlayout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridlayout){
                ForEach(0..<1000){ index in
                    Text("Row \(index)")
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
