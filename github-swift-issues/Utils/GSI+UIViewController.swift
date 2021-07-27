//
//  GSI+UIViewController.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit

extension UIViewController {
    func configureNavigationBar(title: String, largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
        navigationController?.navigationBar.topItem?.title = "Issues list from Swift repository"
        navigationController?.navigationBar.topItem?.largeTitleDisplayMode = largeTitleDisplayMode
    }
}
