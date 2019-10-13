//
//  Artist.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

struct Artist: Decodable, Identifiable {
    let id: UUID = UUID()
    let name: String
    
    enum Keys: String, CodingKey {
        case Name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.name = try container.decode(String.self, forKey: Keys.Name)
    }
    
    init(withName name: String) {
        self.name = name
    }
}
