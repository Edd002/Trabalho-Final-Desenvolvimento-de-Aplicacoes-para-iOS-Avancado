//
//  ContentView.swift
//  codeTutorial_gridCollectionView
//
//  Created by Christopher Guirguis on 3/31/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct MovieGridView: View {

    let title: String
    let movies: [Movie]
    @State var gridLayout = [GridItem(), GridItem()]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.bottom, 10)

            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: gridLayout,
                    alignment: .center,
                    spacing: 0,
                    pinnedViews: [],
                    content: {
                        ForEach(self.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                MovieBackdropCard(movie: movie, isGridView: true)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.leading, 0)
                            .padding(.trailing, 0)
                        }
                })
            }.frame(maxHeight: UIScreen.main.bounds.height - 250)
        }
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
