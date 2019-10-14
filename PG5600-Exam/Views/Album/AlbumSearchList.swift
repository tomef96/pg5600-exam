//
//  AlbumSearchList.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 12/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct AlbumSearchList: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    @State var searchString: String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchString, onSearch: {
                    self.viewModel.searchForAlbums(album: self.searchString)
                })
                AlbumCollectionList(viewModel: viewModel)
            }.navigationBarTitle("Search")
        }
    }
}

struct AlbumSearchList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchList(viewModel: .init(isSearch: true))
    }
}
