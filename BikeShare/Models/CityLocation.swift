//
//  CityLocation.swift
//  BikeShare
//
//  Created by Daniel Slone on 3/9/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

struct CityLocation: Codable {
    let city: String?
    let country: String?
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case city
        case country
        case latitude
        case longitude
    }
}
