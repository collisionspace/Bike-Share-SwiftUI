//
//  BikeShareCity.swift
//  BikeShare
//
//  Created by Daniel Slone on 3/9/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import Foundation

struct BikeShareCity: Codable, Identifiable {
    let href: String?
    let id: String
    let location: CityLocation
    let name: String?

    enum CodingKeys: String, CodingKey {
        case href
        case id
        case location
        case name
    }
}
