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
    
    func test_viewmodel_request() {
        // Give
        let sample = HomeViewModel()
        let expectation = self.expectation(description: "Update condition")
        var updateExists: Bool?
        
        // When
        sample.homeIssuesList(viewController: UIViewController()) { hasUpdate in
            XCTAssertNotNil(hasUpdate)
            updateExists = hasUpdate
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(updateExists)
    }
    
    func test_issuesListRequest_hasValue() {
        //Given
        let expectation = expectation(description: "issueList")
        var issueModel: IssuesResponseModel?
        
        
        //When
        provider.request(.issuesList(limit: 30)) { result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let response):
                XCTAssertNotNil(try? response.map(IssuesResponseModel.self))
                XCTAssertEqual(response.statusCode, 200)
                if let response = try? response.map(IssuesResponseModel.self) {
                    issueModel = response
                    expectation.fulfill()
                }
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        
        
        //Then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(issueModel)
        XCTAssertEqual(issueModel?.first(where: { $0.state == .open })!.state, State.open)
    }
}
