//
//  _EnvironmentObjectDemoApp.swift
//  @EnvironmentObjectDemo
//
//  Created by Vaibhav Sharma on 10/05/24.
//

import SwiftUI

class MYUserData: ObservableObject {
    @Published var userName: String = "Vaibhav Sharma"
}

@main
struct _EnvironmentObjectDemoApp: App {
    
    @StateObject private var userData = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environmentObject(userData)
    }
}
