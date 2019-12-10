//
//  TrackListViewModel.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

class AlbumListViewModel: ObservableObject {
    
    @Published var loading = true
    @Published var albums: [Album] = []
    @Published var images: [String: Image] = Dictionary()
    
    var isSearch = false
    
    init() {
        PopularityApi.getTopFiftyAlbumsOfAllTime() { albums in
            DispatchQueue.main.async {
                self.albums = albums
                self.loading = false
            }
            for album in albums {
                self.downloadImage(from: URL(string: album.thumbnailUrl)!) { image in
                    DispatchQueue.main.async {
                        self.images[album.id] = Image(uiImage: image)
                    }
                }
            }
        }
    }
    
    init(isSearch: Bool) {
        self.isSearch = isSearch
    }
    
    func searchForAlbums(album: String) {
        loading = true
        AlbumApi.search(for: album) { albums in
           DispatchQueue.main.async {
               self.albums = albums
            self.loading = false
           }
        }
    }
    
    func downloadImage(from url: URL, callback: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            guard let uiImage = UIImage(data: data) else { return }
            callback(uiImage)
        }.resume()
    }
    
    init(withTestData: [Album]) {
        self.albums = withTestData
    }
    
}
