//
//  TrackList.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct TrackList: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @ObservedObject var viewModel: TrackListViewModel
    
    func favoriteTrack(track: Track) {
        let trackEntity = FavoriteTrack(context: self.managedObjectContext)
        trackEntity.trackID = Int32(track.id)!
        trackEntity.name = track.name
        trackEntity.artist = track.artist
        trackEntity.duration = track.duration
        do {
            try self.managedObjectContext.save()
        } catch {
            print("Could not save for some reason")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tracks").font(.headline).padding(.vertical)
            VStack {
                ForEach(viewModel.tracks) { track in
                    Button(action: {self.favoriteTrack(track: track)}) {
                        TrackRow(track: track)
                    }
            }
            }.border(Color.black, width: 1)
        }
        
    }
}

struct TrackList_Previews: PreviewProvider {
    static var previews: some View {
        TrackList(viewModel: .init(withTestData: [Track(id: "1", name: "Name", artist: "Artist")]))
    }
}
