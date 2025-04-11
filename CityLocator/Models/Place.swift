//
//  Place.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import Foundation

struct NominatimPlace: Identifiable, Codable {
    let id = UUID()
    let display_name: String
    let lat: String
    let lon: String

    enum CodingKeys: String, CodingKey {
        case display_name, lat, lon
    }
}
