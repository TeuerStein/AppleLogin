//
//  VideoCardView.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/25/21.
//

import SwiftUI

struct VideoCardView: View {
    var video: Video
    var body: some View {
        VStack(spacing: 10) {
            Image(video.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
        }
        .padding(.horizontal)
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
