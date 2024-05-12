//
//  ContentView.swift
//  StepperApp
//
//  Created by Vaibhav Sharma on 29/04/24.
//

import SwiftUI

struct ContentView: View {

    @State private var usedWords : [String] = []
    @State private var newWord : String = ""
    @State private var rootWord : String = "Heee"

    var body: some View{
        NavigationStack {
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                }
                Section{
                    ForEach(usedWords, id: \.self){
                        Text($0)
                    }
                }
            }
            .navigationTitle(rootWord)
        }.onSubmit {
            addWords()
        }
        .onAppear(perform: startGame)
    }

    func addWords() {
        withAnimation {
            usedWords.insert(newWord, at: 0)
            newWord = ""
        }

    }
    func startGame() {
        rootWord = "I m appered on view"
    }
}

struct DateView : View{
    @State private var wakeUp : Date = Date.now
    var body: some View {

        DatePicker("Date picker", selection: $wakeUp, in: setUPComponents()..., displayedComponents: .hourAndMinute)
            .labelsHidden()

    }
    func setUPComponents() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        return date
    }
}

struct StepperView : View{
    @State private var sleepAmount : Double = 8.0
    var body: some View{
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...8, step: 0.25)
    }
}

#Preview {
    ContentView()
}
