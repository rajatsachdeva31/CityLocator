//
//  FavouriteViewModel.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import Foundation

import CoreData

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [FavoritePlace] = []

    func fetchFavorites(context: NSManagedObjectContext) {
        let request: NSFetchRequest<FavoritePlace> = FavoritePlace.fetchRequest()
        do {
            favorites = try context.fetch(request)
        } catch {
            print("Fetch error: \(error)")
        }
    }
}
