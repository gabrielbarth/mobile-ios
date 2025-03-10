//
//  MovieDetailsView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var isFavorite: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            poster
            VStack(alignment: .leading) {
                title
                rating
                categories
                playButton
                MovieSummaryView(summary: movie.summary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .toolbar {
            NavigationLink(value: NavigationScreen.form(movie)) {
                Text("Editar")
            }
        }
    }

    // MARK: - Poster
    @ViewBuilder
    var poster: some View {
        if let image = movie.image,
           let uiimage = UIImage(data: image) {
            Image(uiImage: uiimage)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipped()
        } else {
            Image(systemName: "movieclapper")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.gray.opacity(0.3))
                .padding(40)
                .frame(height: 400)
        }
    }

    // MARK: - Title
    var title: some View {
        Text(movie.title)
            .font(.title)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .multilineTextAlignment(.leading)
    }

    // MARK: - Rating
    var rating: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            Text(movie.rating.description)

            Spacer()

            heart
        }
    }

    // MARK: - Categories
    var categories: some View {
        Text(movie.categories)
    }

    // MARK: - Play Button
    var playButton: some View {
        Button {
            print("Change trailer")
        } label: {
            HStack {
                Image(systemName: "play.fill")
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(60)

                Text("Trailer")
                    .fontWeight(.semibold)
                    .padding(.trailing)
                    .foregroundColor(.primary)
            }
            .padding(3)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(40)
        }
    }

    // MARK: - Heart
    var heart: some View {
        ZStack {
            Circle()
                .frame(width: 34)
                .foregroundStyle(isFavorite ? Color(.systemGray6) : .pink.opacity(0.3))
                .scaleEffect(isFavorite ? 1.2 : 1.0)

            Image(systemName: "heart.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 16, height: 16)
                .foregroundStyle(isFavorite ? .red : .white)
                .scaleEffect(isFavorite ? 1.5 : 1.0)
                .rotationEffect(isFavorite ? .zero : .degrees(360))
        }
        .animation(.spring(bounce: 0.75), value: isFavorite)
        .onTapGesture {
//            withAnimation(.spring(.bouncy(duration: 0.75))) {
                isFavorite.toggle()
//            }
        }
    }

}

#Preview {
    MovieDetailView(movie: Movie(title: "Matrix",
                                 categories: "Action",
                                 duration: "02:30",
                                 rating: 10.0,
                                 summary: "Coool!",
                                 image: nil))
}

#Preview {
    MovieDetailView(movie: Movie(title: "Avengers",
                                 categories: "Action",
                                 duration: "02:30",
                                 rating: 10.0,
                                 summary: "Very nice movie",
                                 image: nil))
}
