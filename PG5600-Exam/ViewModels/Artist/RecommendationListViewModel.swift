//
//  RecommendationListViewModel.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class RecommendationListViewModel: ObservableObject {
    
    @Published var recommendations: [Artist] = []
    
    init(basedOn tracks: [FavoriteTrack]) {
        var query = ""
        for track in tracks {
            if let artist = track.artist { if !query.contains(artist) { query += "\(artist)," } }
        }
        print(query)
        RecommendationApi.getRecommendations(query: query) { artists in
            DispatchQueue.main.async {
                self.recommendations = artists
            }
        }
    }
    
    init(withTestArtists artists: [Artist]) {
        self.recommendations = artists
    }
}
