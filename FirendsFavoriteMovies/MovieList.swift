//
//  MovieList.swift
//  FirendsFavoriteMovies
//
//  Created by Станислав Леонов on 26.06.2025.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        Text("Details view for \(movie.title)")
                    }
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a movie in the list to see its details.")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelConteiner)
}
