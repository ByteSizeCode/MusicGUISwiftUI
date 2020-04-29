//
//  PostDetailView.swift
//  MusicGUISwiftUI
//
//  Loosely based on code created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    let album: Album
    
    var title: some View {
        let vstack = VStack(alignment: .leading) {
            
            Image(album.coverImgName)
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(album.title)
                .font(.title)
                .bold()
            Text(album.artist)
                .font(.caption)
                .opacity(0.75)
        }
        #if os(iOS)
        return vstack
        #elseif os(macOS)
        /// Fill window width
        return vstack.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
        #endif
    }
    
    var body: some View {
        let list = List {
            // Image
//            if post.url.contains(".jpg") || post.url.contains(".png") {
//                RequestImage(Url(post.url), contentMode: .fit)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
//            }
            // GIF
//            if post.subtitle.contains(".gif") {
//                WebView(url: URL(string: post.subtitle)!)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
//            }
            // Title
            if album.description == "" {
//                NavigationLink(destination: WebView(url: URL(string: post.subtitle)!)) {
//                    title
//                }
            } else {
                title
            }
            // Body
            if album.description != "" {
                Text(album.description)
            }
            if album.flairs.count > 0 {
                TagView(genreTage: album.flairs)
            }
            MetadataView(album: album, spaced: true, songList: album.songList)
//            CommentsView(post: post)
        }
        #if os(iOS)
        return list.navigationBarTitle(Text("Category \(album.category)"), displayMode: .inline)
        #else
        return list
        #endif
    }
}
