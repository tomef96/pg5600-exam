//
//  TrackRow.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct AlbumRow: View {
    
    @ObservedObject var viewModel: AlbumViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            viewModel.image.resizable().frame(width: 150, height: 150).shadow(radius: 2)
            Text(viewModel.album.artist).font(.caption).lineLimit(1).padding(.top, 5)
            Text(viewModel.album.name).font(.body).lineLimit(1).padding(.bottom, 5)
        }.frame(width: 150).background(Color(.white)).foregroundColor(.black)
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow(viewModel: .init(album: Album(id: "1", name: "Jumbo", artist: "Queer"))).environment(\.colorScheme, .dark)
    }
}


