//
//  ContentView.swift
//  @StateProperty
//
//  Created by Vaibhav Sharma on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        Button("tap me \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
