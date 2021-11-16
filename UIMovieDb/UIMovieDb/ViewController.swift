//
//  ViewController.swift
//  UIMovieDb
//
//  Created by user201951 on 11/15/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Filmes")
                    }
                }
                .tag(0)

            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
