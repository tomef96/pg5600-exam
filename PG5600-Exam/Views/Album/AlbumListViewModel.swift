//
//  TrackListViewModel.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class AlbumListViewModel: ObservableObject {
    
    static let shared = AlbumListViewModel.init()
    
    @Published var albums: [Album] = []
    
    init() {
        PopularityApi.getTopFiftyAlbumsOfAllTime() { albums in
            DispatchQueue.main.async {
                self.albums = albums
            }
        }
    }
    
    init(isSearch: Bool) {
    }
    
    func searchForAlbums(search: String) {
        AlbumApi.searchForAlbum(album: search) { albums in
           DispatchQueue.main.async {
               self.albums = albums
           }
        }
    }
    
    init(withTestData: [Album]) {
        self.albums = withTestData
    }
    
}
