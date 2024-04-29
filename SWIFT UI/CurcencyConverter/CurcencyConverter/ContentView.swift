//
//  ContentView.swift
//  CurcencyConverter
//
//  Created by Vaibhav Sharma on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    @FocusState private var isAmountFieldFocused : Bool
    // computed property
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isAmountFieldFocused)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 6) {
                            Text("\($0) people")
                        }
                    } .pickerStyle(.navigationLink)
                }

                Section("How much tip do you want to leave?") {

                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }

                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                .navigationTitle("WeSplit")
                .toolbar {
                    if isAmountFieldFocused{
                        Button("Done"){
                            isAmountFieldFocused = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
