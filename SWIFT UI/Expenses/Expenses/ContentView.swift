//
//  ContentView.swift
//  Expenses
//
//  Created by Vaibhav Sharma on 01/05/24.
//

import SwiftUI

struct ExpenseItem : Identifiable, Codable{
    var id = UUID().uuidString
    let name : String
    let type : String
    let amount : Double
}

@Observable
class Expenses {
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "items"){
            guard let storedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) else {
                items = []
                return
            }
            items = storedItems
        }
    }

    var items = [ExpenseItem](){
        didSet{
            if let encode = try? JSONEncoder().encode(items){
                UserDefaults.standard.setValue(encode, forKey: "items")
            }
        }
    }

}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense : Bool = false

    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: { indexSet in
                    removeExpenses(at: indexSet)
                })
            }.sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
            .navigationTitle("IExpenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense.toggle()

                }
            }
        }
    }
    func removeExpenses(at offset : IndexSet)  {
        expenses.items.remove(atOffsets: offset)
    }
}


struct AddView : View{
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expenses: Expenses

    let types = ["Business", "Personal"]
    var body: some View{
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                Picker("Select", selection: $type) {
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)


            }.toolbar{
                Button("Save") {
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(expense)
                }
            }
            Spacer()
            Button("dismiss"){
                dismiss()
            }
            .navigationTitle("Add new expense")
        }
    }
}

#Preview {
    ContentView()
}
