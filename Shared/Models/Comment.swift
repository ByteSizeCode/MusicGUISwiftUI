//
//  Comment.swift
//  MusicGUISwiftUI
//
//  Based on code created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import Foundation

/// A comment from the Reddit API
struct Comment: Decodable {
    let id: String
    let artist: String
    let score: Int
    let body: String?
//    let replies: CommentListing?
    
    enum CommentKeys: String, CodingKey {
        case id
        case artist
        case score
        case body
        case replies
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CommentKeys.self)
        id = try values.decode(String.self, forKey: .id)
        artist = try values.decode(String.self, forKey: .artist)
        score = try values.decode(Int.self, forKey: .score)
        body = try? values.decode(String.self, forKey: .body)
        
//        if let replies = try? values.decode(CommentListing.self, forKey: .replies) {
//            self.replies = replies
//        } else {
//            replies = nil
//        }
    }
}

#if DEBUG
extension Comment {
    /// Used to initialize a Comment for Debug purposes
    init(nested: Int) {
        id = "123"
        artist = "sirarkimedes"
        score = 123556
        body = "This is a body of text that is purely to act as an example!"
//        if nested != 0 {
//            replies = CommentListing(data: CommentListing.CommentListingData(children: [CommentListing.CommentListingData.CommentData(data: Comment(nested: nested - 1))]))
//        } else{
//            replies = nil
//        }
    }
}
#endif
