//
//  ContentView.swift
//  NavigationDeep
//
//  Created by Vaibhav Sharma on 07/05/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }

                        Button("Tap Me 2") {
                            // button action here
                        }
                    }
                }
        }
    }

    func navigationBarModified() -> some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            //.toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
