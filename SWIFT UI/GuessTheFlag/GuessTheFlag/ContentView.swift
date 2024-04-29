//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Vaibhav Sharma on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany","Ireland"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore: Bool = false
    @State private var scoreTitle = ""
    @State private var showingAlert: Bool = false
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()


            VStack(spacing: 15){

                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack {
                    Text("Tap the Flag of").font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.width(.standard))
                }



                VStack {
                    ForEach(0..<3){ index in
                        Button(action: {
                            flagTapped(index)
                        }, label: {
                            Image(countries[index])
                                .clipShape(.capsule).shadow(radius: 5)
                        })
                    }
                }



            }.frame(maxWidth: .infinity)
                .padding()
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
            VStack {
                Spacer()
                Spacer()
                Text("Score: ???")
                    .foregroundStyle(.white)
                .font(.title.bold())
            }


        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        }message: {
            Text("Score: ???")
                .foregroundStyle(.white)
                .font(.title.bold())
        }
    }
    func flagTapped(_ number : Int) {
        if number == correctAnswer{
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
