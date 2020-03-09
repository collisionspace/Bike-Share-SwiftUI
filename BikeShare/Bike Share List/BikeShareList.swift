//
//  BikeShareList.swift
//  BikeShareSwiftUI
//
//  Created by Daniel Slone on 3/1/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI

struct BikeShareList: View {

    @Binding var bikeShares: [BikeShareCity]

    var body: some View {
        VStack {
            List(bikeShares) { bikeShare in
                VStack(alignment: .leading) {
                    Text(bikeShare.name ?? "nil")
                    Text(bikeShare.location.city ?? "nil")
                }
            }
        }
    }
}

