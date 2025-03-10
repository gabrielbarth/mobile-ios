//
//  MapView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager = CLLocationManager()
    @State private var searchString: String = ""
    @State private var selectedPOI: MKMapItem?
    @State private var pointsOfInterest: [MKMapItem] = []
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var route: MKRoute?

    private let utfpr = CLLocationCoordinate2D(latitude: -26.1976857,
                                               longitude: -52.6901529)

    var body: some View {
        //POI: Points of Interest
        NavigationStack {
            Map(position: $position, selection: $selectedPOI) {
//            Marker("UTFPR", systemImage: "building.2.fill", coordinate: utfpr)
                UserAnnotation()

                ForEach(pointsOfInterest, id: \.self) { poi in
                    Marker(item: poi)
                }

                if let route {
                    MapPolyline(route)
                        .stroke(.purple, lineWidth: 7)
                        .mapOverlayLevel(level: .aboveRoads)
                }
            }
            .mapStyle(.standard(elevation: .realistic))
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .onAppear {
                locationManager.requestWhenInUseAuthorization()
                position = .automatic
            }
            .searchable(text: $searchString)
            .navigationTitle("Mapa")
            .onMapCameraChange { context in
                visibleRegion = context.region
            }
            .onSubmit(of: .search, searchForPOI)
            .onChange(of: selectedPOI) {
                getDirections()
            }
        }
    }

    private func searchForPOI() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchString
        request.region = visibleRegion ?? MKCoordinateRegion()

        let search = MKLocalSearch(request: request)

        Task {
            guard let response = try? await search.start() else { return }
            pointsOfInterest = response.mapItems
            position = .automatic
        }
    }

    private func getDirections() {
        route = nil
        guard let sourceCoordinate = locationManager.location?.coordinate,
              let destination = selectedPOI
        else { return }

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        request.destination = destination
        //request.transportType = .walking

        let directions = MKDirections(request: request)
        Task {
            let response = try? await directions.calculate()
            route = response?.routes.first

            withAnimation {
                position = .camera(MapCamera(centerCoordinate: sourceCoordinate,
                                             distance: 400,
                                             heading: 0,
                                             pitch: 45))
            }
            guard let route else { return }
            print("Nome da rota:", route.name)
            print("Distância em metros:", route.distance)
            print("Duração em segundos:", route.expectedTravelTime)

            for step in route.steps {
                print(step.instructions)
            }
        }
    }
}

#Preview {
    MapView()
}
