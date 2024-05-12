//
//  ContentView.swift
//  AppStorage
//
//  Created by Vaibhav Sharma on 01/05/24.
//

import SwiftUI

struct ContentView: View {
@AppStorage("taCount") private var tapCount = 0
    var body: some View {
        Button("Tap Count : \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
