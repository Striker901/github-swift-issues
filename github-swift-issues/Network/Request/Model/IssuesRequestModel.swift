//
//  IssuesRequestModel.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation

struct IssuesRequestModel {
    let filter: Filter? = nil
    let state: State? = nil
    let sort: Sort? = nil
    let direction: Direction? = nil
}
