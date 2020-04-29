//
//  SortBy.swift
//  MusicGUISwiftUI
//
//  File origionally created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import Foundation

/// Sorting method for Reddit API
enum SortBy: String, CaseIterable {
    case All
    case Pop
    case Classical
    case Rock
    case Other
}
