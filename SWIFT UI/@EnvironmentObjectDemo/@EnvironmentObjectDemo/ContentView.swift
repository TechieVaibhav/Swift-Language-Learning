//
//  ContentView.swift
//  @EnvironmentObjectDemo
//
//  Created by Vaibhav Sharma on 10/05/24.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var userName: String = "Vaibhav Sharma"
}

struct ContentView: View {
    @StateObject private var userData = UserData()

    var body: some View {
        NavigationStack{
            VStack {

                Text("i m parent View")
                Text(userData.userName)
                NavigationLink("go to Next"){
                    // destination
                    ChildView1()
                }
            }
        }.environmentObject(userData)
    }
}

struct ChildView1 : View{
    var body: some View{
        Text("I m child 1")
        NavigationLink("Go to next") {
            LastView()
        }
    }
}

struct LastView : View{
    @EnvironmentObject var userData : UserData
    var body: some View{
        Text("I m Last View ")
        Text(userData.userName)
    }
}



#Preview {
    ContentView()
}
