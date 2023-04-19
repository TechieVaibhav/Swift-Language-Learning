//
//  CircleImage.swift
//  Vallabhbhai Patel
//
//  Created by Vaibhav Sharma on 24/03/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("svp")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white))
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
