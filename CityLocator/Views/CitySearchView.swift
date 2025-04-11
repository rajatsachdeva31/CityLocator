//
//  CitySearchView.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import Foundation
import SwiftUI

struct CitySearchView: View {
    @StateObject private var viewModel = CitySearchViewModel()

    var body: some View {
        VStack {
            TextField("Enter city name", text: $viewModel.query)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                viewModel.searchCity()
            }) {
                Text("Search")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
            }
            .padding(.horizontal)

            List(viewModel.results) { place in
                NavigationLink(destination: MapView(place: place)) {
                    Text(place.display_name)
                }
            }
        }
        .navigationTitle("City Locator")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: FavoritesView()) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .accessibilityLabel("Go to Favorites")
                }
            }
        }
    }
}
