//
//  RecommendationApi.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class RecommendationApi: Api {
    
    static let key = "347809-PG5600Ex-Z9MHCQUU"
    
    static func getRecommendations(query: String, callback: @escaping ([Artist]) -> Void) {
        let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        let url = URL(string: "https://tastedive.com/api/similar?k=\(key)&type=music&q=\(searchQuery)")!
        apiGetArray(url: url, subpath: ["Similar", "Results"]) { artists in
            callback(artists)
        }
    }
}
