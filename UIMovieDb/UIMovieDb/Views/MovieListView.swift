//
//  MovieListView.swift
//  UIMovieDb
//
//  Created by user201951 on 11/15/21.
//

import SwiftUI

struct MovieListView: View {

    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()

    var body: some View {
        NavigationView {
            List {
                Group {
                    if topRatedState.movies != nil {
                        MovieBackdropCarouselView(title: "Mais Avaliados", movies: topRatedState.movies!)
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: "Em Cartaz", movies: nowPlayingState.movies!)
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if upcomingState.movies != nil {
                        MovieBackdropCarouselView(title: "Em Breve", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
            }
            .navigationBarTitle("Outras Categorias")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
