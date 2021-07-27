//
//  HomeViewModelTest.swift
//  github-swift-issuesTests
//
//  Created by Vinícius D. Brandão on 27/07/21.
//

import XCTest
@testable import github_swift_issues
@testable import Moya

class HomeViewModelTest: XCTestCase {
    
    private let provider: MoyaProvider<HomeTarget> = .init()

    func test_homeIssuesList_withValidRequest() throws {
        let request = HomeAPI()
        let requestData = IssueResponseModel(user: UserResponseModel(avatarURL: URL(string: "https://avatars.githubusercontent.com/u/608696?v=4")!, login: "lorentey"), htmlURL: URL(string:"https://github.com/apple/swift/pull/38635")!, state: .open, title: "[stdlib] Update SubSequence docs", body: "[SE-0234] removed the `SubSequence` associated type from `Sequence`, moving it up to `Collection`. Update the docs to reflect this.\r\n\r\n[SE-0234]: https://github.com/apple/swift-evolution/blob/master/proposals/0234-remove-sequence-subsequence.md", createdAt: "2021-07-26T20:36:04Z")
        
        request.issuesList { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertEqual(requestData.body, response.first(where: { $0.user.login == requestData.user.login })?.body)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
}
