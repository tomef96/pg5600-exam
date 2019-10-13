//
//  TrackRow.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct TrackRow: View {
    
    let track: Track
    
    var body: some View {
        HStack {
            Text(track.name)
            Spacer()
            Text(track.duration)
        }.padding()
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var previews: some View {
        TrackRow(track: Track(id: "1", name: "Jumbo", artist: "Queer"))
    }
}
