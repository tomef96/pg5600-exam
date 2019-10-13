//
//  RecommendationApi.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class RecommendationApi {
    
    static let key = "347809-PG5600Ex-Z9MHCQUU"
    
    static func getRecommendations(query: String, callback: @escaping ([Artist]) -> Void) {
        let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        let url = URL(string: "https://tastedive.com/api/similar?k=\(key)&type=music&q=\(searchQuery)")!
        print(url)
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {print(error)}
            guard let data = data else {return}
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            print(json)
            let similar = json["Similar"] as! [String: AnyObject]
            let artists = similar["Results"] as! [AnyObject]
            
            var result: [Artist] = []
            for a in artists {
                let dataTrack = a as! [String: Any]
                let jsonTrack = try! JSONSerialization.data(withJSONObject: dataTrack, options: .fragmentsAllowed)
                let artist = try! JSONDecoder().decode(Artist.self, from: jsonTrack)
                result.append(artist)
            }
            callback(result)
        }.resume()
    }
}
