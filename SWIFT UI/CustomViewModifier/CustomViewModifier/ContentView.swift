//
//  ContentView.swift
//  CustomViewModifier
//
//  Created by Vaibhav Sharma on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.blue
            .frame(width: 100,height: 100)
            .applyCustomModifier(with: "Vaibhav content")
    }
}

struct WaterMarked :ViewModifier{
    var text : String
    func body(content : Content) -> some View {
        ZStack(alignment: .bottomTrailing){
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View{
    func applyCustomModifier(with text : String) -> some View {
        modifier(WaterMarked(text: text))
    }
}

#Preview {
    ContentView()
}
