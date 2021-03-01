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
            VideoPlayerView()
                .frame(height: 250)
            
            GeometryReader { geometry in
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
                }
                .padding()
            }
            
            Spacer(minLength: 0)
        }
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
