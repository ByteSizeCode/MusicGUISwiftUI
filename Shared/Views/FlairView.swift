//
//  TagView.swift
//  MusicGUISwiftUI
//
//  Loosely based on code created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import SwiftUI

struct TagView: View {
    let flairs: [String]
    
    func flair(_ name: String) -> some View {
        Text(name)
            .font(.caption)
            .foregroundColor(.primary)
            .padding(5)
            .background(Color.secondary.opacity(0.5))
            .cornerRadius(4)
    }
    
    var body: some View {
        HStack {
            ForEach(flairs, id: \.self) {
                self.flair($0)
            }
        }
    }
}

#if DEBUG
struct FlairView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(flairs: ["Hello", "World"])
    }
}
#endif
