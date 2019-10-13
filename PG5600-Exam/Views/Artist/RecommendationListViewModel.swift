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
    
    init() {
        RecommendationApi.getRecommendations(query: "Michael Jackson") { artists in
            DispatchQueue.main.async {
                self.recommendations = artists
            }
        }
    }
    
    init(withTestArtists artists: [Artist]) {
        self.recommendations = artists
    }
}
