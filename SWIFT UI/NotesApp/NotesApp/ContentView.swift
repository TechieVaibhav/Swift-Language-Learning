//
//  ContentView.swift
//  NotesApp
//
//  Created by Vaibhav Sharma on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
