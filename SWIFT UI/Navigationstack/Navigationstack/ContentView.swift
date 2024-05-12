//
//  ContentView.swift
//  Navigationstack
//
//  Created by Vaibhav Sharma on 21/04/24.
//

import SwiftUI

struct User : Hashable{
    let name: String
}

struct ContentView: View {
    @State private var path = NavigationPath()
    var user = User(name: "Vaibhav")

    var body: some View {
        navigationPath()
    }


    func navigationPath() -> some View{
        NavigationStack(path: $path) {
            VStack{
                Button("Show 32") {
                    path.append(user)
                }
            }
            .navigationDestination(for: User.self, destination: { selection in
                Text("\(selection.name)")
            })
            .navigationTitle("swift UI")
        }
    }

    func navigationStack() -> some View {
        NavigationStack{
            Form {
                Text("Hey I have navigation")
                    .navigationTitle("Swift")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
