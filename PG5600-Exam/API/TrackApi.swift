//
//  Track.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class TrackApi {
    static func getTracksFrom(album: String, callback: @escaping ([Track]) -> Void) {
        let url = URL(string: "https://theaudiodb.com/api/v1/json/1/track.php?m=\(album)")!
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {print(error)}
            guard let data = data else {return}
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            let tracks = json["track"] as! [AnyObject]
            
            var result: [Track] = []
            for t in tracks {
                let dataTrack = t as! [String: Any]
                let jsonTrack = try! JSONSerialization.data(withJSONObject: dataTrack, options: .fragmentsAllowed)
                let track = try! JSONDecoder().decode(Track.self, from: jsonTrack)
                result.append(track)
            }
            callback(result)
        }.resume()
    }
}

