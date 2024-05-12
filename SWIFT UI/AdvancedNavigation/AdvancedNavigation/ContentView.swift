//
//  ContentView.swift
//  AdvancedNavigation
//
//  Created by Vaibhav Sharma on 05/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List(0..<10){ i in
                NavigationLink("Row : \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("\(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
