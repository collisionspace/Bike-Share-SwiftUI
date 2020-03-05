//
//  ContentView.swift
//  BikeShareSwiftUI
//
//  Created by Daniel Slone on 3/5/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI
import Mapbox

struct ContentView: View {

    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Mapbox",
                           coordinate: .init(latitude: 37.791434, longitude: -122.396267))
    ]

    var body: some View {
        TabView {
            MapView(annotations: $annotations)
            .centerCoordinate(.init(latitude: 37.791293, longitude: -122.396324))
            .zoomLevel(16)
                .tabItem {
                    Text("Map")
            }

            BikeShareList()
                .tabItem {
                    Text("List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
