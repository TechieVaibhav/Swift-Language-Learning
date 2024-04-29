//
//  ContentView.swift
//  Project3
//
//  Created by Vaibhav Sharma on 24/04/24.
//

import SwiftUI

struct ContentView: View {

    @ViewBuilder var spells: some View {
        Text("Vaibhav")
        Text("Sharma with View Builder")
    }

    var body: some View {
        spells
    }
}

#Preview {
    ContentView()
}
