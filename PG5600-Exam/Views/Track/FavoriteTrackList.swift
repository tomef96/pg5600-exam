//
//  FavoriteTrackList.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 12/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct FavoriteTrackList: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: FavoriteTrack.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \FavoriteTrack.name, ascending: true)
        ]
    ) var tracks: FetchedResults<FavoriteTrack>
    
    func removeTrackFromFavorites(at offsets: IndexSet) {
        for index in offsets {
            let track = tracks[index]
            managedObjectContext.delete(track)
        }
    }
    
    var body: some View {
        VStack {
            List {
                Text("Favorites").font(.largeTitle).fontWeight(.bold).padding(.vertical)
                ForEach(tracks, id: \.self) { track in
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(track.name ?? "Something went wrong")
                            Text(track.artist ?? "Something went wrong")
                        }
                        Spacer()
                        Text(track.duration ?? "Something went wrong")
                    }
                }.onDelete(perform: removeTrackFromFavorites)
                
            }
            Spacer()
            RecommendationList(viewModel: .init())
        }
        
    }
}

struct FavoriteTrackList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTrackList()
    }
}
