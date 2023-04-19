//
//  ContentView.swift
//  Vallabhbhai Patel
//
//  Created by Vaibhav Sharma on 23/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: 0) {
                MapView()
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)
                
                CircleImage()
                    .offset(y: -80)
                    .padding(.bottom, -80)
                
                VStack(alignment: .leading){
                    Text("SARDAR VALLABHBHAI PATEL")
                        .font(.subheadline)
                    
                    HStack {
                        Text("Statue of Unity")
                        Spacer()
                        Text("Gujarat")
                        
                    }.font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Divider()
                        .background(Color.gray)
                    
                    Text("About Statue of Unity")
                        .font(.title2)
                    Text("Vallabhbhai Jhaverbhai Patel, commonly known as Sardar Patel, was an Indian lawyer, influential political leader, barrister and statesman who served as the first Deputy Prime Minister and Home Minister of India from 1947 to 1950.")
                        .font(.body)
                    
                    Spacer()
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
