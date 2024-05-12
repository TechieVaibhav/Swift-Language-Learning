//
//  ContentView.swift
//  Images
//
//  Created by Vaibhav Sharma on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("end_Image")
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }

    func overlayImage() -> some View{
        ZStack{
              Image("end_Image")
                .aspectRatio(contentMode: .fit)// Resize image to fit while maintaining aspect ratio

              Text("Hey I am overlay")
                .foregroundColor(.white) // White text color
                .opacity(1) // Fully opaque text
                .padding() // Add some padding around the text
                .font(.title) // Adjust text size accordingly (optional)
                .fontWeight(.bold) // Make text bold (optional)
                .shadow(radius: 5)
                 // Position text at the top
            }
    }
}
#Preview {
    ContentView()
}
