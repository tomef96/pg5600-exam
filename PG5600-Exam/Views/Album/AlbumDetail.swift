//
//  TrackDetail.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct AlbumDetail: View {
    
    @ObservedObject var viewModel: AlbumViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                viewModel.image.resizable().scaledToFit()
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.album.name).font(.headline)
                        Spacer()
                        Text(viewModel.album.yearOfRelease)
                    }
                    Text(viewModel.album.artist).font(.subheadline)
                    TrackList(viewModel: .init(albumId: viewModel.album.id))
                    Spacer()
                }.padding()
            }
        }
    }
}

struct AlbumDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetail(viewModel: .init(album: Album(id: "1", name: "Jumbo", artist: "Queer")))
    }
}
