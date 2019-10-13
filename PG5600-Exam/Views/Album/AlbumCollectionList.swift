//
//  AlbumCollectionList.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct AlbumCollectionList: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
        
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
        ScrollView(.vertical, showsIndicators: true) {
            if viewModel.albums.count > 0 {
                ForEach(coupleAlbums(), id: \.[0].id) { albums in
                    HStack {
                        Spacer()
                        NavigationLink(destination: AlbumDetail(viewModel: .init(album: albums[0]))) {
                            if self.viewModel.isSearch {
                                AlbumRow(viewModel: .init(album: albums[0]))
                            } else {
                                AlbumRow(viewModel: .init(album: albums[0], image: self.viewModel.images[albums[0].id] ?? Image(uiImage: UIImage(named: "testImage")!)))
                            }
                        }.buttonStyle(PlainButtonStyle())
                        Spacer()
                        if albums.count > 1 {
                            NavigationLink(destination: AlbumDetail(viewModel: .init(album: albums[1]))) {
                                if self.viewModel.isSearch {
                                    AlbumRow(viewModel: .init(album: albums[1]))
                                } else {
                                    AlbumRow(viewModel: .init(album: albums[1], image: self.viewModel.images[albums[1].id] ?? Image(uiImage: UIImage(named: "testImage")!)))

                                }
                            }.buttonStyle(PlainButtonStyle())
                            Spacer()
                        }
                    }
                }.padding(.top, 20)
            } else {
                Text("Loading").padding()
            }
        }
    }
}

struct AlbumCollectionList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCollectionList(viewModel: .init(withTestData: [Album(id: "1", name: "Name", artist: "Artist")]))
    }
}
