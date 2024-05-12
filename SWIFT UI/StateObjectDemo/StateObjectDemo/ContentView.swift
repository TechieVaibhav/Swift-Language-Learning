//
//  ContentView.swift
//  StateObjectDemo
//
//  Created by Vaibhav Sharma on 10/05/24.
//

import SwiftUI

//Add items into list
class ViewModel : ObservableObject{
    @Published var listItems = ["Black Hero","SuperMan"]
}


struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            List(viewModel.listItems, id: \.self) { item in
                Text(item)
            }
            .navigationTitle("Marvel Heroes")
            .toolbar(content: {
                Button {
                    //action
                    viewModel.listItems.append("SpiderMan")
                } label: {
                    Image(systemName: "plus")
                }
            })
            .toolbar(content: {
                Button {
                    //action
                    path.append("2")
                } label: {
                    Image(systemName: "heart")
                }
            })
            .navigationDestination(for: String.self) { _ in
                AnotherView(viewModel: viewModel)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct AnotherView :View{

    @ObservedObject  var viewModel : ViewModel

    var body: some View{
        Text(viewModel.listItems.last ?? "")
    }
}

#Preview {
    ContentView()
}
