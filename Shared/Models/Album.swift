//
//  Album.swift
//  MusicGUISwiftUI
//
//  File origionally created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import Foundation

struct Album: Decodable, Identifiable {
    let title: String
    let songList:[String]
    let artist: String
    let genreTags: [String]
    let id: String
    
    /// Extra, unused
    let description: String
    let selftext_html: String?
    let coverImgName: String
    let subtitle: String
    
    let category: String
    let score: Int
    let num_comments: Int
    let stickied: Bool
    let created_utc: Double
    let preview: Preview?
    let is_original_content: Bool
    let spoiler: Bool
    
    var flairs: [String] {
        var res: [String] = []
        if !genreTags.isEmpty {
            res = genreTags
        }
        if is_original_content {
            res.append("Origional")
        }
        if spoiler {
            res.append("Spoiler")
        }
        return res
    }
    
    let replies: [Self]?
    
    struct Preview: Decodable {
        let images: [PreviewImage]
        let enabled: Bool
        
        struct PreviewImage: Decodable {
            let source: ImageSource
            let resolutions: [ImageSource]
            let id: String
            
            struct ImageSource: Decodable {
                let url: String
                let width: Int
                let height: Int
            }
        }
    }
}
