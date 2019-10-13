//
//  AlbumApi.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 12/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class AlbumApi {
    static func searchForAlbum(album: String, callback: @escaping ([Album]) -> Void) {
        let searchQuery = album.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        let url = URL(string: "https://theaudiodb.com/api/v1/json/1/searchalbum.php?a=\(searchQuery!)")!
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {print(error)}
            guard let data = data else {return}
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            if let albums = json["album"] as? [AnyObject] {
                var result: [Album] = []
                for t in albums {
                    let dataTrack = t as! [String: Any]
                    let jsonTrack = try! JSONSerialization.data(withJSONObject: dataTrack, options: .fragmentsAllowed)
                    let album = try! JSONDecoder().decode(Album.self, from: jsonTrack)
                    result.append(album)
                }
                callback(result)
            } else {
                callback([])
            }
        }.resume()
    }
}
