//
//  TrackListViewModel.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation
import UIKit

class TrackListViewModel: ObservableObject {
    
    @Published var tracks: [Track] = []
    
    init(albumId: String) {
        TrackApi.getTracksFrom(album: albumId) { tracks in
            DispatchQueue.main.async {
                self.tracks = tracks
            }
        }
    }
    
    init(withTestData: [Track]) {
        self.tracks = withTestData
    }
    
}
