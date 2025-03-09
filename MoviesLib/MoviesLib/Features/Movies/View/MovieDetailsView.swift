//
//  MovieDetailsView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import SwiftUI

struct MovieDetailsView: View {
    var body: some View {
        VStack( spacing: 10) {

            poster
            VStack(alignment: .leading) {
                title
                rating
                categories
                playButton
                MovieSummaryView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
    
    // MARK: - Poster
    var poster: some View {
        Image("avengers")
            .resizable()
            .scaledToFill() // scaledToFit
            .frame(height: 400)
            .clipped()
    }
    
    // MARK: - Title
    var title: some View {
        Text("Avengers")
            .font(.title)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .multilineTextAlignment(.leading)
    }
    
    // MARK: - Rating
    var rating: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text("10.00")
            
            Spacer()
            
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(Color.pink.opacity(0.3))
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(.white)
            }
        }
    }
    
    // MARK: - Categories
    var categories: some View {
        Text("Sci-Fi, Action")
    }
    
    // MARK: - PlayButton
    var playButton: some View {
        Button {
           print("tocar trailer")
        } label: {
            HStack {
                Image(systemName: "play.fill")
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(60)
                
                Text("Trailler")
                    .fontWeight(.semibold)
                    .padding(.trailing)
                    .foregroundColor(.primary)
            }
            .padding(3)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(40)
        }
    }
}

#Preview {
    MovieDetailsView()
}
