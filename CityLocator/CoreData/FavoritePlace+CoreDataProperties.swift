//
//  FavoritePlace+CoreDataProperties.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//
//

import Foundation
import CoreData


extension FavoritePlace {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritePlace> {
        return NSFetchRequest<FavoritePlace>(entityName: "FavoritePlace")
    }

    @NSManaged public var name: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var timestamp: Date?

}

extension FavoritePlace : Identifiable {

}
