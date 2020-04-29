//
//  ContentViewState.swift
//  MusicGUISwiftUI
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Combine

/// An `ObservableObject` to store information selected in the `NSToolbar`
final class ContentViewState: ObservableObject {
    @Published var category: String = "Genre"
    @Published var sortBy: SortBy = .All
}
