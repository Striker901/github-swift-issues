//
//  HomeAPI.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation
import Moya

final class HomeAPI {
    typealias IssuesCompletion = (Result<IssuesResponseModel, Error>) -> Void
    private let provider: MoyaProvider<HomeTarget> = .init()
    
    func issuesList(completion: @escaping IssuesCompletion) {
        provider.request(.issuesList(limit: 99)) { result in
            switch result {
            case .success(let response):
                if let response = try? response.map(IssuesResponseModel.self) {
                    completion(.success(response))
                }
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
