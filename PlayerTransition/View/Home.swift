//
//  Home.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/25/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 15) {
                    
                    ForEach(videos) { video in
                        
                        VideoCardView(video: video)
                    }
                }
            }
            
            MiniPlayer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
