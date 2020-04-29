//
//  AlbumNamesList.swift
//  MusicGUISwiftUI
//
//  File origionally created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import SwiftUI

struct AlbumNamesList: View {
    let category: String
    let sortBy: SortBy
    
    //Add cells here
    let library = [
        Album(title: "Album 1", songList: ["Royalty-Free1", "Royalty-Free2"], artist: "Author here.", genreTags: ["pop"], id: "0", description: "This is a description of album 1.\nAnd a new line here.", selftext_html: nil, coverImgName: "a1cover", subtitle: "Subtitle here", category: "notused", score: 1000, num_comments: 50, stickied: false, created_utc: Date().timeIntervalSince1970 - 100, preview: nil, is_original_content: false, spoiler: false, replies: nil),
        Album(title: "Album 2", songList: ["Royalty-Free4", "Royalty-Free5"], artist: "Author here.", genreTags: ["rock","other tag"], id: "1", description: "This is a description of album 2.\nAnd a new line here.", selftext_html: nil, coverImgName: "a2cover", subtitle: "Subtitle here", category: "notused", score: 1000, num_comments: 50, stickied: false, created_utc: Date().timeIntervalSince1970 - 100, preview: nil, is_original_content: false, spoiler: false, replies: nil)
    ]
    
    var body: some View {
        List {
            Section(header: Text("\(category) | \(sortBy.rawValue)")) {
                /// Load posts from web and decode as `Listing`
               
                    ForEach(library) { album in
                        if(self.sortBy.rawValue.capitalizingFirstLetter() != "Other" &&
                            (self.sortBy.rawValue.capitalizingFirstLetter() == "All" ||
                            album.genreTags.map {$0.lowercased()}
                                .contains("\(self.sortBy.rawValue.lowercased())"))) { //if user-selected sort tag is found in album's tags, show album in list on the side
                            NavigationLink(destination: PostDetailView(album: album)) {
                                AlbumView(album: album)
                                    .tag(album.id)
                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                    /// Double-click to open a new window for the `PostDetailView`
                                    .onTapGesture(count: 2) {
                                        let controller = DetailWindowController(rootView: PostDetailView(album: album))
                                        controller.window?.title = album.title
                                        controller.showWindow(nil)
                                }
                            }
                        }
                 /* Code for tab Other
                         //Code
//                        else {
//                            //
//                            ForEach(0..<album.genreTags.count-1) { i in
//                                if (!SortBy.allCases.map { $0.rawValue}.contains(
//                                    album.genreTags.map {$0.lowercased()}[i]
//                                    )) {
//                                    NavigationLink(destination: PostDetailView(album: album)) {
//                                        AlbumView(album: album)
//                                            .tag(album.id)
//                                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
//                                            /// Double-click to open a new window for the `PostDetailView`
//                                            .onTapGesture(count: 2) {
//                                                let controller = DetailWindowController(rootView: PostDetailView(album: album))
//                                                controller.window?.title = album.title
//                                                controller.showWindow(nil)
//                                        }
//                                    }
//                                }
//                            }
//                            //
//
//                        }
                        */
                        
                        /* Button for testing
//                        if(true) {
//                            Button(action: {
////                                print("\(self.sortBy.rawValue.lowercased())")
////                                print(album.genreTags.map {$0.lowercased()})
////                                print(album.genreTags.map {$0.lowercased()}.contains("\(self.sortBy.rawValue.lowercased())"))
////                                if(!SortBy.allCases.map{ $0.rawValue}.contains(
////                                    album.genreTags.map {$0.lowercased()}[0]
////                                )) {
////
////                                }
//
//                                print(self.sortBy.rawValue.capitalizingFirstLetter() == "Other")
//                                print(SortBy.allCases.map { $0.rawValue})
//                                print(self.sortBy.rawValue.capitalizingFirstLetter())
//
//                                print(!SortBy.allCases.map { $0.rawValue}.contains(
////                                    self.sortBy.rawValue.capitalizingFirstLetter()
//                                    album.genreTags.map {$0.lowercased()}[0]
//                                ))
//
//                            }) {
//                               Text("CLICK")
//                            }
//                        }
 */
                    }
                    /// Spinner when loading
//                    SpinnerView()
                
            }
        }
        .listStyle(SidebarListStyle())
    }
}
