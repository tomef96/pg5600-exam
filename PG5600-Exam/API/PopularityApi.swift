//
//  Popularity.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 10/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class PopularityApi {
            
    static func getTopFiftyTracksOfAllTime(callback: @escaping ([Track]) -> Void) {
        let apiUrl = URL(string: "https://theaudiodb.com/api/v1/json/1/mostloved.php?format=track")!
        URLSession.shared.dataTask(with: apiUrl) {data, response, error in
            if let error = error {print(error)}
            guard let data = data else {return}
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            let loved = json["loved"] as! [AnyObject]
            
            var result: [Track] = []
            for t in loved {
                let dataTrack = t as! [String: Any]
                let jsonTrack = try! JSONSerialization.data(withJSONObject: dataTrack, options: .fragmentsAllowed)
                let track = try! JSONDecoder().decode(Track.self, from: jsonTrack)
                result.append(track)
            }            
            callback(result)
        }.resume()
    }
    
    static func getTopFiftyAlbumsOfAllTime(callback: @escaping ([Album]) -> Void) {
        print("Fetching albums")
        let apiUrl = URL(string: "https://theaudiodb.com/api/v1/json/1/mostloved.php?format=album")!
        URLSession.shared.dataTask(with: apiUrl) {data, response, error in
            if let error = error {print(error)}
            guard let data = data else {return}
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            let loved = json["loved"] as! [AnyObject]
            
            var result: [Album] = []
            for t in loved {
                let dataTrack = t as! [String: Any]
                let jsonTrack = try! JSONSerialization.data(withJSONObject: dataTrack, options: .fragmentsAllowed)
                let track = try! JSONDecoder().decode(Album.self, from: jsonTrack)
                result.append(track)
            }
            callback(result)
        }.resume()
    }
}
