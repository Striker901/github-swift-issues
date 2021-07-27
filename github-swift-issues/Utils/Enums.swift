//
//  Enums.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation

enum Filter: String, Codable {
    case assigned, created, mentioned, subscribed, all
}

enum State: String, Codable {
    case open, closed, all
}

enum Sort: String, Codable {
    case created, updated, comments
}

enum Direction: String, Codable {
    case ascending = "asc",
         descending = "desc"
}
