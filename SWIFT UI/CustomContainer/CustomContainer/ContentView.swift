//
//  ContentView.swift
//  CustomContainer
//
//  Created by Vaibhav Sharma on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GridView(rows: 4, columns: 4) { row, column in
            Text("Row : \(row) column : \(column)")
        }
    }
}

struct GridView<Content : View> : View{
    var rows : Int
    var columns : Int
    var content : (Int, Int) -> Content

    var body: some View{
        VStack {
            ForEach(0..<rows, id: \.self){ row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content( row, column)
                    }.padding()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
