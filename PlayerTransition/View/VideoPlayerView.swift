//
//  VideoPlayerView.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/27/21.
//

import SwiftUI
import AVKit

// I'm going to use UIKit Video Player since
// SwiftUI Video Player is not having enough features
struct VideoPlayerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        
        // Video URL
        let bundle_url = Bundle.main.path(forResource: "video", ofType: "mp4")
        let video_url = URL(fileURLWithPath: bundle_url!)
        
        // Video Player
        let player = AVPlayer(url: video_url)
        
        controller.player = player
        
        // Hiding Controls
        controller.showsPlaybackControls = false
        controller.player?.play()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
