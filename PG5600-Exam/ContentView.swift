//
//  ContentView.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 10/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        TabView {
            AlbumList(viewModel: .init()).tabItem({
                Image(systemName: "50.square")
                Text("Top 50")
            })
            AlbumSearchList(viewModel: .init(isSearch: true)).tabItem({
                Image(systemName: "magnifyingglass")
                Text("Search")
            })
            FavoriteTrackList().tabItem({
                Image(systemName: "star")
                Text("Favorites")
            })
        }
        //CollectionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
