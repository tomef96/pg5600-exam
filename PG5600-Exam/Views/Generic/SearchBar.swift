//
//  SearchBar.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 12/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI

// INSPIRED BY: https://stackoverflow.com/questions/56490963/how-to-display-a-search-bar-with-swiftui
struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    var onSearch: () -> Void

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String
        
        var onSearch: () -> Void

        init(text: Binding<String>, onSearch: @escaping () -> Void) {
            _text = text
            self.onSearch = onSearch
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.endEditing(true)
            onSearch()
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, onSearch: onSearch)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        return
    }
    
    typealias UIViewType = UISearchBar
        
}


