//
//  ContentView.swift
//  OpenAnotherView
//
//  Created by Vaibhav Sharma on 01/05/24.
//

import SwiftUI

struct SecondView : View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct ContentView: View {
    @State private var isShowing = false
    var body: some View {
        Button("sheet open to view") {
            isShowing.toggle()
        }.sheet(isPresented: $isShowing, content: {
            SecondView()
        })
    }
}

#Preview {
    ContentView()
}
