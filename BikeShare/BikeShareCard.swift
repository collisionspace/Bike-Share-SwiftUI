//
//  BikeShareCard.swift
//  BikeShare
//
//  Created by Daniel Slone on 3/7/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI

struct BikeShareCard: View {
    var body: some View {
        VStack {
            Spacer()
            .frame(height: 45)
            .background(Color.green)
            BikeShareList()
        }
    }
}

struct BikeShareCard_Previews: PreviewProvider {
    static var previews: some View {
        BikeShareCard()
    }
}
