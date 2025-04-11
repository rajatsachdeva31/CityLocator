//
//  Favourites.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import SwiftUI
import Foundation

struct FavoritesView: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel = FavoritesViewModel()

    var body: some View {
        List(viewModel.favorites, id: \.self) { place in
            NavigationLink(
                destination: MapView(
                    place: NominatimPlace(
                        display_name: place.name ?? "Unknown",
                        lat: "\(place.latitude)",
                        lon: "\(place.longitude)"
                    )
                )
            ) {
                Text(place.name ?? "Unknown Place")
            }
        }
        .onAppear {
            viewModel.fetchFavorites(context: context)
        }
        .navigationTitle("Favorites")
    }
}
