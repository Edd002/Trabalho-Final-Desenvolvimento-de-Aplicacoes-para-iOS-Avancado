//
//  MovieListGridView.swift
//  UIMovieDb
//
//  Created by user201951 on 12/5/21.
//

import SwiftUI

struct MovieListGridView: View {

    @ObservedObject private var popularState = MovieListState()

    var body: some View {
        NavigationView {
            List {
                Group {
                    if popularState.movies != nil {
                        MovieGridView(title: "Populares", movies: popularState.movies!)
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
            }
            .navigationBarTitle("Home")
        }
        .onAppear {
            self.popularState.loadMovies(with: .popular)
        }
    }
}

struct MovieGridListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

