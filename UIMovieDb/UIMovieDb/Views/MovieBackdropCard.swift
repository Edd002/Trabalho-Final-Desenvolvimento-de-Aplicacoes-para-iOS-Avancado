//
//  MovieBackdropCard.swift
//  UIMovieDb
//
//  Created by user201951 on 11/15/21.
//

import SwiftUI

struct MovieBackdropCard: View {

    let movie: Movie
    let isGridView: Bool
    @ObservedObject var imageLoader = ImageLoader()

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)

            if isGridView {
                Text(movie.title).font(Font.system(size: 10))
            } else {
                Text(movie.title)
            }
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie, isGridView: false)
    }
}
