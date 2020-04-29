//
//  AlbumView.swift
//  MusicGUISwiftUI
//
//  Loosely based on code created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import SwiftUI
//import Request

struct AlbumView: View {
    let album: Album
    
    var body: some View {
        HStack(spacing: 5) {
//            if album.thumbnail != "" {
//               Image(album.thumbnail)
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50, alignment: .center)
//                    .clipped()
//                    .cornerRadius(5.0)
//            }
            VStack(alignment: .leading) {
                #if os(iOS)
                Text(album.title)
                    .font(.headline)
                    .lineLimit(1)
                #elseif os(macOS)
                Text(album.title)
                    .bold()
                #endif
                /// Body preview
                Group {
//                    if album.subtitle.contains("reddit") {
//                        Text(album.description != "" ? album.description : " ")
//                    } else {
                        Text(album.subtitle)
//                    }
                }
                    .font(.caption)
                    .opacity(0.75)
                    .lineLimit(1)
                /// Metadata for the album
//                MetadataView(album: album, spaced: false)
//                    .font(.caption)
//                    .opacity(0.75)
            }
        }
    }
}
