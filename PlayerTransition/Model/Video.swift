//
//  Video.swift
//  PlayerTransition
//
//  Created by OLEKSANDR SOKOLOV on 2/24/21.
//

import SwiftUI

// Simple model for objects
struct Video: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
}

var videos = [
    Video(image: "thumb1", title: "Advanced Map Kit"),
    Video(image: "thumb2", title: "Realm DB CRUD Operations"),
    Video(image: "thumb3", title: "SwiftUI Complex Info"),
    Video(image: "thumb4", title: "Animated Sricky Header"),
    Video(image: "thumb5", title: "Shared App For Both macOS And iOS")
]
