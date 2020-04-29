//
//  ContentView.swift
//  MusicGUISwiftUI
//
//  Created by Carson Katri on 7/20/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var sortBy: SortBy = .All
    
    @State private var showSortSheet: Bool = false
    @State private var showSubredditSheet: Bool = false
    
    @State private var selectedAlbum: String? = nil
    
    @EnvironmentObject private var state: ContentViewState
    
    var body: some View {
        NavigationView {
            /// Load the albums
            AlbumNamesList(category: state.category, sortBy: state.sortBy)
                .frame(minWidth: 300)
            Text("Select an album")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .touchBar {
            /*Picker("Sort By", selection: $state.sortBy) {
                ForEach(SortBy.allCases, id: \.rawValue) { sort in
                    Text(sort.rawValue)
                }
            }*/
            Text("Hello, World!")
        }
    }
}
