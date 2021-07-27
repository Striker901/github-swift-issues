//
//  HomeView.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Views
    lazy var tableView = makeTableView()
    
    // MARK: - Make views
    private func makeTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .insetGrouped)
        tableView.separatorStyle = .singleLine
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentMode = .scaleToFill
        tableView.clipsToBounds = true
        
        return tableView
    }
    
    private func addViews() {
        addSubview(tableView)
    }
    
    // MARK: - Constraints
    private func addConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaInsets)
        }
    }
}
