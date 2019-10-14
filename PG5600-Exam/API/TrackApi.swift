//
//  Track.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class TrackApi: Api {
    static func getTracksFrom(album: String, callback: @escaping ([Track]) -> Void) {
        let url = URL(string: "https://theaudiodb.com/api/v1/json/1/track.php?m=\(album)")!
        apiGetArray(url: url, subpath: ["track"]) { tracks in
            callback(tracks)
        }
    }
}

