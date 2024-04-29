//
//  ContentView.swift
//  Form
//
//  Created by Vaibhav Sharma on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Language")
            }
            Section {
                Text("Time")
                Text("Theme")
            }
        }
    }
}

#Preview {
    ContentView()
}
