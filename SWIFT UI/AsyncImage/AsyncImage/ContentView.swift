//
//  ContentView.swift
//  AsyncImage
//
//  Created by Vaibhav Sharma on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.red
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
