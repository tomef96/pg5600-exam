//
//  Track.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 10/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation
import SwiftUI

struct Track: Codable, Identifiable {
    let id: String
    let name: String
    let artist: String
    let thumbnailUrl: String
    let duration: String
    
    enum Keys: String, CodingKey {
        case idTrack
        case strTrack
        case strArtist
        case intDuration
        case strTrackThumb
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(String.self, forKey: Keys.idTrack)
        self.name = try container.decode(String.self, forKey: Keys.strTrack)
        self.artist = try container.decode(String.self, forKey: Keys.strArtist)
        let duration = try Int(container.decode(String.self, forKey: Keys.intDuration))
        let minutes = duration! / 1000 / 60
        let seconds = duration! / 1000 - minutes * 60
        self.duration = "\(minutes):\(seconds < 10 ? "0\(seconds)" : "\(seconds)")"
        self.thumbnailUrl = (try? container.decode(String.self, forKey: Keys.strTrackThumb)) ?? "https://learn.getgrav.org/system/images/media/thumb-jpg.png"
    }
    
    
    
    public init(id: String, name: String, artist: String) {
        self.id = id
        self.name = name
        self.artist = artist
        self.duration = "1337"
        self.thumbnailUrl = "https://learn.getgrav.org/system/images/media/thumb-jpg.png"
    }
    
}
