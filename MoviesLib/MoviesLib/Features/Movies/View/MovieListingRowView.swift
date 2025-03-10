//
//  MovieListingRowView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import SwiftUI

struct MovieListingRowView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 23) {
            if let image = movie.image,
               let uiimage = UIImage(data: image) {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 80)
                    .cornerRadius(8)
                    .shadow(radius: 4, x: 2, y: 2)
            } else {
                Image(systemName: "movieclapper")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 80)
            }

            Text(movie.title)

            Spacer()
        }
    }
}

#Preview {
    MovieListingRowView(movie: Movie(title: "Matrix", categories: "", duration: "", rating: 0, summary: "", image: nil))
}
