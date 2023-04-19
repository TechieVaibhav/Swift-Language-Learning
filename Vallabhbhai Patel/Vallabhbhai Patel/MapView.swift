//
//  MapView.swift
//  Vallabhbhai Patel
//
//  Created by Vaibhav Sharma on 24/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 21.8380, longitude: 73.7191), span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9))
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
