//
//  Album.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

struct Album: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let artist: String
    let yearOfRelease: String
    let thumbnailUrl: String
    
    enum Keys: String, CodingKey {
        case idAlbum
        case strAlbum
        case strArtist
        case intYearReleased
        case strAlbumThumb
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(String.self, forKey: Keys.idAlbum)
        self.name = try container.decode(String.self, forKey: Keys.strAlbum)
        self.artist = try container.decode(String.self, forKey: Keys.strArtist)
        self.yearOfRelease = try container.decode(String.self, forKey: Keys.intYearReleased)
        let thumbnailUrl = (try? container.decode(String.self, forKey: Keys.strAlbumThumb)) ?? "https://learn.getgrav.org/system/images/media/thumb-jpg.png"
        if thumbnailUrl.isEmpty {
            self.thumbnailUrl = "https://learn.getgrav.org/system/images/media/thumb-jpg.png"
        } else {
            self.thumbnailUrl = thumbnailUrl
        }
    }
    
    public init(id: String, name: String, artist: String) {
        self.id = id
        self.name = name
        self.artist = artist
        self.yearOfRelease = "1337"
        self.thumbnailUrl = "https://learn.getgrav.org/system/images/media/thumb-jpg.png"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id
    }
}
