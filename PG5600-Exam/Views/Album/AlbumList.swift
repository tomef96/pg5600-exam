//
//  TrackList.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 11/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct AlbumList: View {
    
    @State var viewMode = ViewMode.big
    
    @ObservedObject var viewModel: AlbumListViewModel
        
    func setViewMode(viewMode: ViewMode) {
        self.viewMode = viewMode
    }
    
    enum ViewMode {
        case big
        case small
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if $viewMode.wrappedValue == ViewMode.big {
                    AlbumCollectionList(viewModel: viewModel)
                } else {
                    List(viewModel.albums) { album in
                        NavigationLink(destination: AlbumDetail(viewModel: .init(album: album))) {
                            HStack {
                                Text(album.name).font(.headline)
                                Spacer()
                                Text(album.artist).font(.subheadline)
                            }
                        }
                    }
                }
            }.navigationBarTitle("Top 50 Albums").navigationBarItems(trailing: navigationItems)
        }
    }
    
    var navigationItems: some View {
        HStack {
            Button(action: { self.setViewMode(viewMode: ViewMode.small) }) {
                Image(systemName: "list.dash").resizable().frame(width: 20, height: 20, alignment: .center).padding(.horizontal, 5)
            }
            Button(action: { self.setViewMode(viewMode: ViewMode.big) }) {
                Image(systemName: "square.grid.2x2.fill").resizable().frame(width: 20, height: 20, alignment: .center).padding(.horizontal, 5)
            }
            Spacer()
        }
    }
}

struct AlbumList_Previews: PreviewProvider {
    
    static let testAlbums = [
        Album(id: "1", name: "Jumbo", artist: "Queer"),
        Album(id: "2", name: "Enter Sandman", artist: "Metallica"),
        Album(id: "3", name: "Happy", artist: "Pharell"),
        Album(id: "4", name: "Sad", artist: "LLerahp"),
        Album(id: "1", name: "Jumbo", artist: "Queer"),
        Album(id: "2", name: "Enter Sandman", artist: "Metallica"),
        Album(id: "3", name: "Happy", artist: "Pharell"),
        Album(id: "4", name: "Sad", artist: "LLerahp")
    ]
    
    static var previews: some View {
        AlbumList(viewModel: .init(withTestData: testAlbums)).environment(\.colorScheme, .dark)
    }
}
