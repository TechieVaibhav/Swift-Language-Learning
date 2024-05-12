//
//  ContentView.swift
//  RemoveItemsFromList
//
//  Created by Vaibhav Sharma on 01/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var number : Int = 1

    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: { indexSet in
                        removeNumber(at: indexSet)
                    })
                }
                Button("Add Number") {
                    addNumber()
                }
            }
            
            .toolbar{
                EditButton()
            }
        }
    }

    func addNumber() {
        numbers.append(number)
        number += 1
    }

    func removeNumber(at offset : IndexSet) {
        numbers.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
