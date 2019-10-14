//
//  Popularity.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 10/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class PopularityApi: Api {
            
    static func getTopFiftyTracksOfAllTime(callback: @escaping ([Track]) -> Void) {
        let url = URL(string: "https://theaudiodb.com/api/v1/json/1/mostloved.php?format=track")!
        apiGetArray(url: url, subpath: ["loved"]) { tracks in
            callback(tracks)
        }
    }
    
    static func getTopFiftyAlbumsOfAllTime(callback: @escaping ([Album]) -> Void) {
        let url = URL(string: "https://theaudiodb.com/api/v1/json/1/mostloved.php?format=album")!
        apiGetArray(url: url, subpath: ["loved"]) { albums in
            callback(albums)
        }
    }
}
