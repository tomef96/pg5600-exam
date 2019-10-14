//
//  AlbumApi.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 12/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class AlbumApi: Api {
    static func search(for album: String, callback: @escaping ([Album]) -> Void) {
        let searchQuery = album.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        let url = URL(string: "https://theaudiodb.com/api/v1/json/1/searchalbum.php?a=\(searchQuery!)")!
        apiGetArray(url: url, subpath: ["album"]) { albums in
            callback(albums)
        }
    }
}
