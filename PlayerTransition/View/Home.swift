//
//  Home.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/25/21.
//

import SwiftUI

struct Home: View {
    @StateObject var player = VideoPlayerViewModel()
    
    // Gesture state to avoid drag gesture glitches
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 15) {
                    
                    ForEach(videos) { video in
                        
                        VideoCardView(video: video)
                            .onTapGesture {
                                withAnimation {
                                    player.showPlayer.toggle()
                                }
                            }
                    }
                }
            }
            
            if player.showPlayer {
                MiniPlayer()
                    // Move from bottom
                    .transition(.move(edge: .bottom))
                    .offset(y: player.offset)
                    .gesture(DragGesture().updating($gestureOffset, body: { (value, state, _) in
                        state = value.translation.height
                    })
                    .onEnded(onEnd(value:)))
            }
        }
        .onChange(of: gestureOffset, perform: { value in
            onChanged()
        })
        // Setting environment obj
        .environmentObject(player)
        
    }
    
    func onChanged() {
        if player.offset >= 0 && !player.isMiniPlayer {
            player.offset = gestureOffset
        }
    }

    func onEnd(value: DragGesture.Value) {
        withAnimation(.default) {
            player.offset = 0
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
