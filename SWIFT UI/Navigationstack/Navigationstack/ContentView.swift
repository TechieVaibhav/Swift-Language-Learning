//
//  ContentView.swift
//  Navigationstack
//
//  Created by Vaibhav Sharma on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Form {
                Text("Hey I have navigation")
                    .navigationTitle("Swift")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
