//
//  RecommendationList.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

struct RecommendationList: View {
    
    @ObservedObject var viewModel: RecommendationListViewModel
    
    var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.2)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended artists").font(.headline).animation(animation).transition(.slide).padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    listPadding
                    ForEach(viewModel.recommendations) { artist in
                        VStack {
                            Text(artist.name)
                                .frame(width: 125, height: 100)
                            .foregroundColor(Color(UIColor(named: "recommendationColor")!))
                            .colorInvert()
                            .background(Color(UIColor(named: "recommendationColor")!))
                        }.padding(.leading, 5)
                        
                    }
                    listPadding
                }
            }.transition(.slide).animation(animation)
        }.padding(.vertical)
    }
    
    var listPadding: some View {
        VStack {
            Text("")
        }.frame(width: 10, height: 0)
    }
}

struct RecommendationList_Previews: PreviewProvider {
    
    static var artists = [
        Artist(withName: "Queen"),
        Artist(withName: "Korn"),
        Artist(withName: "Muse"),
        Artist(withName: "Queen"),
        Artist(withName: "Queen"),
        Artist(withName: "Korn"),
        Artist(withName: "Muse"),
        Artist(withName: "Queen")
    ]
    
    static var previews: some View {
        RecommendationList(viewModel: .init(withTestArtists: artists))
    }
}
