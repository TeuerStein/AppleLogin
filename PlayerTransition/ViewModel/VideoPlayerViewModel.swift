//
//  VideoPlayerViewModel.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 3/6/21.
//

import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    
    // MiniPlayer properties
    @Published var showPlayer = false
    
    // Gesture offset
    @Published var offset: CGFloat = 0
    @Published var isMiniPlayer = false
}
