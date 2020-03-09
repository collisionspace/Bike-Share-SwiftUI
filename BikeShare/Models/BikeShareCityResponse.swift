//
//  BikeShareCityResponse.swift
//  BikeShare
//
//  Created by Daniel Slone on 3/9/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

class BikeShareCityResponse: Codable {
    let networks: [BikeShareCity]?

    enum CodingKeys: String, CodingKey {
        case networks
    }
}
