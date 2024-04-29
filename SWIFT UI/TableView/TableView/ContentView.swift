//
//  ContentView.swift
//  TableView
//
//  Created by Vaibhav Sharma on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    // array of player
    var players : [Player] = []

    var body: some View {

        NavigationStack {
            List(players) { player in
                HStack {
                    Image(player.imageName)
                          .resizable() // Allow image resizing
                          .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                          .frame(width: 100, height: 100)
                          .clipShape(Circle()) // Clip to a circular shape
                          .overlay(Circle().stroke(Color.gray, lineWidth: 1)) // Optional: Add a border

                    VStack(alignment: .leading) {
                        Text(player.name)
                        Text("Hello, world!")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }.navigationTitle("ssss")
    }
}

#Preview {
    ContentView(players: testData)
}
