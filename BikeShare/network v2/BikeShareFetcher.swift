//
//  BikeShareFetcher.swift
//  BikeShare
//
//  Created by Daniel Slone on 3/9/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import Foundation
import Mapbox

class BikeShareFetcher: ObservableObject {
    @Published var bikeShares = [BikeShareCity]()
    @Published var annotations = [MGLPointAnnotation]()

    func load() {
        let url = URL(string: "https://api.citybik.es/v2/networks")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode(BikeShareCityResponse.self, from: d)
                    DispatchQueue.main.async {
                        self.bikeShares = decodedLists.networks ?? []
                        self.annotations = self.bikeShares.map { bikeShare in
                            let city = MGLPointAnnotation()
                            city.title = bikeShare.name
                            city.subtitle = bikeShare.location.city
                            city.coordinate = CLLocationCoordinate2D(latitude: bikeShare.location.latitude, longitude: bikeShare.location.longitude)
                            return city
                        }
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
    }
}
