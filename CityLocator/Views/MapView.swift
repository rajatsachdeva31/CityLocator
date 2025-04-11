//
//  MapView.swift
//  CityLocator
//
//  Created by Rajat Sachdeva on 2025-04-11.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    var place: NominatimPlace
    @Environment(\.managedObjectContext) private var context

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(place.lat) ?? 0,
            longitude: Double(place.lon) ?? 0
        )
    }

    @State private var region: MKCoordinateRegion

    init(place: NominatimPlace) {
        self.place = place
        let center = CLLocationCoordinate2D(
            latitude: Double(place.lat) ?? 0,
            longitude: Double(place.lon) ?? 0
        )
        _region = State(initialValue: MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: [place]) { place in
                MapMarker(coordinate: coordinate, tint: .red)
            }
            .ignoresSafeArea() // 🔥 Make map fullscreen by ignoring safe area

            Spacer()

            Button("Save to Favorites") {
                let newPlace = FavoritePlace(context: context)
                newPlace.name = place.display_name
                newPlace.latitude = Double(place.lat) ?? 0
                newPlace.longitude = Double(place.lon) ?? 0
                newPlace.timestamp = Date()

                do {
                    try context.save()
                } catch {
                    print("Save error: \(error)")
                }
            }
            .padding()
        }
        .navigationTitle(place.display_name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
