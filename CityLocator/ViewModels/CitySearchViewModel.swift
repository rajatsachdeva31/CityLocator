//
//  CitySearchViewModel.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import Foundation

class CitySearchViewModel: ObservableObject {
    @Published var query = ""
    @Published var results: [NominatimPlace] = []

    func searchCity() {
        guard let urlQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://nominatim.openstreetmap.org/search?q=\(urlQuery)&format=json") else { return }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let places = try JSONDecoder().decode([NominatimPlace].self, from: data)
                    DispatchQueue.main.async {
                        self.results = places
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
    }
}
