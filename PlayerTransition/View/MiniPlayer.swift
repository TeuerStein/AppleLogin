//
//  MiniPlayer.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/27/21.
//

import SwiftUI

struct MiniPlayer: View {
    
    // ScreenHeight
    @State var height: CGFloat = 0
    @EnvironmentObject var player: VideoPlayerViewModel
    
    var body: some View {
        VStack {
            
            // Video Player
            // There is a bug with URL path for video player
            // For that I use an Image
            HStack {
                Image("video")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: player.isMiniPlayer ? 150 : player.width, height: player.isMiniPlayer ? 70 : getFrame())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
                .onAppear(perform: {
                    self.height = geometry.frame(in: .global).height + 230
                })
            }
            .background(Color.white)
            .opacity(player.isMiniPlayer ? 0 : getOpacity())
            .frame(height: player.isMiniPlayer ? 0 : nil)
            
            Spacer(minLength: 0)
        }
        .frame(width: .infinity, height: player.isMiniPlayer ? 70 : abs(UIScreen.main.bounds.height))
        .padding(.top, player.isMiniPlayer ? 10 : 0)
        .edgesIgnoringSafeArea(.all)
        .background(
            Color.white
                .ignoresSafeArea(.all, edges: .all)
        )
    }
    
    // Getting frame and opacity while dragging
    
    func getFrame() -> CGFloat {
        let progress = player.offset / (height - 100)
        
        if (1 - progress) <= 1.0 {
            let videoHeight: CGFloat = (1 - progress) * 230
            
            // Stopping height at 70
            if videoHeight <= 70 {
                // Decresing width
                let percent = videoHeight / 70
                let videoWidth: CGFloat = percent * UIScreen.main.bounds.width
                DispatchQueue.main.async {
                    // Stopping at 150
                    if videoWidth >= 150 {
                        player.width = videoWidth

                    }
                }
                return 70
            }
            
            // Preview WILL have animation problems
            DispatchQueue.main.async {
                player.width = UIScreen.main.bounds.width
            }
            
            return videoHeight
        }
        
        return 230
    }
    
    func getOpacity() -> Double {
        let progress = player.offset / (height - 100)
        
        if progress <= 1 {
            return Double(1 - progress)
        }
        
        return 1
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
