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
    
    func coupleAlbums() -> [[Album]] {
        var result: [[Album]] = []
        for i in 0...viewModel.albums.count-1 {
            if i % 2 == 0  {
                var couple: [Album] = []
                let firstAlbum = viewModel.albums[i]
                if let secondAlbum = viewModel.albums.count > i+1 ? viewModel.albums[i+1] : nil {
                    couple = [firstAlbum, secondAlbum]
                } else {
                    couple = [firstAlbum]
                }
                result.append(couple)
            }
        }
        return result
    }

    var body: some View {
        collectionView
    }
    
    var collectionView: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchString, onSearch: {
                    self.viewModel.searchForAlbums(search: self.searchString)
                })
                ScrollView(.vertical, showsIndicators: true) {
                    if viewModel.albums.count > 0 {
                        ForEach(coupleAlbums(), id: \.[0].id) { albums in
                            HStack {
                                Spacer()
                                NavigationLink(destination: AlbumDetail(viewModel: .init(album: albums[0]))) {
                                    AlbumRow(viewModel: .init(album: albums[0]))
                                }.buttonStyle(PlainButtonStyle())
                                Spacer()
                                if albums.count > 1 {
                                    NavigationLink(destination: AlbumDetail(viewModel: .init(album: albums[1]))) {
                                        AlbumRow(viewModel: .init(album: albums[1]))
                                    }.buttonStyle(PlainButtonStyle())
                                    Spacer()
                                }
                            }
                        }.padding(.top, 20)
                    } else {
                        Text("").padding(.top, 20)
                    }
                }
            }.navigationBarTitle("Search")
        }
    }
}

struct AlbumSearchList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchList(viewModel: .init(isSearch: true))
    }
}
