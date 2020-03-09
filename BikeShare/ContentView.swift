//
//  ContentView.swift
//  BikeShareSwiftUI
//
//  Created by Daniel Slone on 3/5/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {

    @ObservedObject var fetcher = BikeShareFetcher()

    var body: some View {
        TabView {
            MapView(annotations: self.$fetcher.annotations)
            .tabItem {
                Image(systemName: "map")
                Text("Map")
            }

            BikeShareList(bikeShares: self.$fetcher.bikeShares)
            .tabItem {
                Text("List")
            }
        }.onAppear(perform: fetcher.load)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
