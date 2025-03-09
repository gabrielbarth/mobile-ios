//
//  MovieSummaryView.swift
//  MoviesLib
//
//  Created by Gabriel Barth on 09/03/25.
//

import SwiftUI

struct MovieSummaryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sinopsis")
                .padding(.top)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView {
                Text("This movie is awesome! It's a great adventure with a lot of action and humor.")
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
        .padding(.vertical)
    }
}

#Preview {
    MovieSummaryView()
}
