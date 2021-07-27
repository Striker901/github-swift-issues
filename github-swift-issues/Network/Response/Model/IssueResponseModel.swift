//
//  IssueResponseModel.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation

typealias IssuesResponseModel = [IssueResponseModel]

struct IssueResponseModel: Codable {
    private enum CodingKeys: String, CodingKey {
        case user, state, title, body
        case htmlURL = "html_url"
        case createdAt = "created_at"
    }
    
    let user: UserResponseModel
    let htmlURL: URL
    let state: State
    let title, body, createdAt: String
}

struct UserResponseModel: Codable {
    let avatar_url: URL
}
