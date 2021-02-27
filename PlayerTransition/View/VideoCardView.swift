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
        VStack(spacing: -30) {
            Image(video.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            
            HStack(spacing: 15) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(video.title)
                        .fontWeight(.semibold)
                        .font(.callout)
                    
                    HStack {
                        Text("Teuer Stein")
                            .fontWeight(.bold)
                            .font(.caption)
                        
                        Text(".12K Views. 5 Days Ago")
                            .font(.caption)
                    }
                    .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal)
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
