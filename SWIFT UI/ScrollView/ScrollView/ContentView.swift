//
//  ContentView.swift
//  ScrollView
//
//  Created by Vaibhav Sharma on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

struct CustomText : View{
    var text: String
    var body: some View{
        Text(text)
            .font(.title)
    }
    init(_ text: String) {
        print("Custom Text Creating")
        self.text = text
    }
}

#Preview {
    ContentView()
}
