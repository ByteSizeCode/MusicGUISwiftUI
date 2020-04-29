//
//  MetadataView.swift
//  MusicGUISwiftUI
//
//  Loosely based on code created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import AudioToolbox
import AVFoundation
import SwiftUI

let audioEngine: AVAudioEngine = AVAudioEngine()
let audioPlayer: AVAudioPlayerNode = AVAudioPlayerNode()
let aud = MusicManager()

struct MetadataView: View {
    let album: Album
    let spaced: Bool
    var songList:[String]
    @State var selectionKeeper = Set<String>()
    @State var playing = false
    
    var stickied: some View {
        Group {
            /// Pinned icon
//            if album.stickied {
//                Image(systemName: "pin.fill")
//                    .rotationEffect(Angle(degrees: 45))
//                    .foregroundColor(Color("stickied"))
//            }
            if spaced {
                Spacer()
            }
        }
    }
    
    var body: some View {
        /// Spacers are placed to fill the width of the screen if desired
        VStack {
            HStack {
                if spaced {
                    Spacer()
                }
                stickied
                /// Tuples store the SF Symbols, text, and color
//                ForEach([("arrow.up", "\(album.score)", Color.orange), ("text.bubble", "\(album.num_comments)", Color.primary), ("clock", "\(timeSince(album.created_utc))", Color.primary)], id: \.0) { data in
//                    Group {
//                        Image(systemName: data.0)
//                        Text(data.1)
//                        if self.spaced {
//                            Spacer()
//                        }
//                    }
//                    .foregroundColor(data.2)
//                }
            }

//            Text("----")
            
            NavigationView {
                        VStack {
                            List(songList, id: \.self, selection: $selectionKeeper) { item in
                                VStack {
                                HStack {
                                    Text(item)
                                        .onTapGesture {
                                            print(item)
                                        }
                                    Spacer()
                                    Button(action: {
                                        print(item)
                                        aud.setup(forSong: item, withExtension: "mp3")
                                        self.playing.toggle()
                                        self.playing ? audioPlayer.play() : audioPlayer.pause() //Play/pause on click
                                        print("Clicked")
                                    }) {
                                        Text(self.playing ? "Pause" : "Play")
                                    }
                                    .padding(.trailing, 4.0)
               
                                    
                                }
                            }//
                                
                            }
                        }
                        .frame(width: 500, height: 300, alignment: .center)
                    }
            
//            Text("aaaaa")
            
            
            
            //////////
        }
    }
}

//#if DEBUG
//struct MetadataView_Previews: PreviewProvider {
//    static var previews: some View {
//        MetadataView(album: album.example, spaced: true)
//    }
//}
//#endif
