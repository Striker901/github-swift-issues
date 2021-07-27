//
//  HomeTarget.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation
import Moya

enum HomeTarget {
    case issuesList(limit: Int)
}

extension HomeTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com/repos/apple/swift")!
    }
    
    var path: String {
        return "/issues"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .issuesList(let limit):
            return .requestParameters(parameters: ["per_page": limit], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/vnd.github.v3+json"]
    }
}
