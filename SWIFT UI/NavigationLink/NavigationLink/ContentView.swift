//
//  ContentView.swift
//  NavigationLink
//
//  Created by Vaibhav Sharma on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        linkWithMoreInfo()
    }

    func linkWithMoreInfo() -> some View {
        NavigationStack{
            NavigationLink {
                Text("desti-nation point")
            }label: {
                Text("More Text")
                Text("More info")
                Image(systemName:  "face.smiling")
            }
        }
    }
    func navigationLinkwithList() -> some View{
        NavigationStack{
            List(0..<10) { item in
                NavigationLink("\(item)"){
                    // on detail view
                    Text("Row : \(item)")
                }
            }
            .navigationTitle("List View")
        }
    }

    func navigationLink() -> some View{
        NavigationStack{
            NavigationLink("Tap on me to details") {
                //
                Text("hey i am detail view")
            }
            .navigationTitle("SwitUI")
        }
    }
}

#Preview {
    ContentView()
}
