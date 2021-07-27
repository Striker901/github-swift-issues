//
//  GSI+UITableView.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit

extension UITableView {
    func configureTableView(delegate: UITableViewDelegate? = nil, dataSource: UITableViewDataSource? = nil, dragDelegate: UITableViewDragDelegate? = nil, dropDelegate: UITableViewDropDelegate? = nil) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.dragDelegate = dragDelegate
        self.dropDelegate = dropDelegate
    }
}
