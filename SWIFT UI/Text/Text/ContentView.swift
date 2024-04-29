//
//  ContentView.swift
//  Text
//
//  Created by Vaibhav Sharma on 03/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        Text("Hello world")
                .fontWeight(.bold) // bold font
                 .font(.largeTitle) // largeTitle or
                 .font(.system(size: 10)) // for a fix size or
                 .font(.custom("Helvetica neue", size: 20)) // pass custom font with size.
                 .foregroundColor(.blue) // foreground color
                 .multilineTextAlignment(.center) // for center allignment
                 .lineLimit(1) // line limit in paragraph
                 .truncationMode(.tail) // truncate the text from tail.
                 .padding(.all)  // padding surround the text.
                 .rotationEffect(.degrees(45)) // rotate the text
                 .rotation3DEffect(
                    .degrees(70),
                    axis: (x: 0.0, y: 1.0, z: 1.0)
                ) // rotate the text with 3DEffect.
               .shadow(color:.red, radius: 0,x: 40,y: 0)  // shadow over text.
    }
}

#Preview {
    ContentView()
}
