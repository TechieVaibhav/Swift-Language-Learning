//
//  ContentView.swift
//  CustomView
//
//  Created by Vaibhav Sharma on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            CapsuleText(text: "Vaibhav")
                .foregroundStyle(.yellow)
            CapsuleText(text: "Sharma")
                .foregroundStyle(.orange)
        }
    }
}

struct CapsuleText : View {
    var text : String = ""
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)

    }
}

#Preview {
    ContentView()
}
