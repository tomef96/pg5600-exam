//
//  TrackViewModel.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation
import SwiftUI

class AlbumViewModel: ObservableObject {
    
    @Published var album: Album
    @Published var image: Image = Image("testImage")

    init(album: Album) {
        self.album = album
        downloadImage(from: URL(string: album.thumbnailUrl)!) { image in
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }
    }
    
    init(album: Album, image: Image) {
        self.album = album
        self.image = image
    }
    
    func downloadImage(from url: URL, callback: @escaping (UIImage) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            guard let uiImage = UIImage(data: data) else { return }
            callback(uiImage)
        }.resume()
    }
}
