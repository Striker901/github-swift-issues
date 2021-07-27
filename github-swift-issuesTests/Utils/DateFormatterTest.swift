//
//  DateFormatterTest.swift
//  github-swift-issuesTests
//
//  Created by Vinícius D. Brandão on 27/07/21.
//

import XCTest
@testable import github_swift_issues

class DateFormatterTest: XCTestCase {
    
    func test_formatDateFromString() throws {
        let date: String = "2021-07-26T20:36:04Z"
        
        let formatedDate = date.formatDateFrom("yyyy-MM-dd'T'HH:mm:ssZ", to: "dd/MM/yyyy")
        
        XCTAssertEqual(formatedDate, "26/07/2021")
    }
}
