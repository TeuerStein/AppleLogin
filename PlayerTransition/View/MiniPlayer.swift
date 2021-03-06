//
//  MiniPlayer.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/27/21.
//

import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        VStack {
            
            // Video Player
            // There is a bug with URL path for video player
            // For that I use an Image
            Image("video")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 18) {
                        // Video playback details and buttons
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("M1 MacBook Unboxing And First Impressions")
                                .font(.callout)
                            
                            Text("1.2M Views")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Buttons
                        HStack {
                            PlayBackVideoButtons(image: "hand.thumbsup", text: "123K")
                            
                            PlayBackVideoButtons(image: "hand.thumbsdown", text: "12K")
                            
                            PlayBackVideoButtons(image: "square.and.arrow.up", text: "Share")
                            
                            PlayBackVideoButtons(image: "square.and.arrow.down", text: "Download")
                            
                            PlayBackVideoButtons(image: "message", text: "Live Chat")
                        }
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.horizontal)
                        
                        Divider()
                        
                        VStack(spacing: 15) {
                            
                            ForEach(videos) { video in
                                
                                VideoCardView(video: video)
                            }
                        }
                        .padding(.horizontal, -10)
                    }
                    .padding()
                }
            }
            
            Spacer(minLength: 0)
        }
        .edgesIgnoringSafeArea(.all)
        .background(
            Color.white
                .ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PlayBackVideoButtons: View {
    var image: String
    var text: String
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.title3)
                
                Text(text)
                    .fontWeight(.semibold)
                    .font(Font.system(size:10))
            }
        })
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
    }
}
