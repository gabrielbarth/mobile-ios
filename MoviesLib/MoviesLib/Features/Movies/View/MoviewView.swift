//
//  MoviewView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import SwiftUI

enum NavigationScreen: Hashable {
    case detail(Movie)
    case form(Movie?)
}

struct MoviesView: View {

    @State private var path = NavigationPath()
    @State private var searchString: String = ""

    var body: some View {
        NavigationStack(path: $path) {
            MovieListingView(searchString: searchString)
                .navigationTitle("Movies")
                .searchable(text: $searchString, prompt: "Enter movie name")
                .navigationDestination(for: NavigationScreen.self) { destination in
                    switch destination {
                    case .detail(let movie):
                        MovieDetailView(movie: movie)
                    case .form(let movie):
                        MovieFormView(movie: movie, path: $path)
                    }
                }
                .toolbar {
                    Button("", systemImage: "plus.circle.fill") {
                        path = NavigationPath([NavigationScreen.form(nil)])
                    }
                }
        }
    }
}

#Preview {
    MoviesView()
}
