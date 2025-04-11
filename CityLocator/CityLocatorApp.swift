//
//  CityLocatorApp.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import SwiftUI

@main
struct CityLocatorApp: App {
    let persistenceController = PersistenceController.shared

        var body: some Scene {
            WindowGroup {
                NavigationView {
                    CitySearchView()
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
}
