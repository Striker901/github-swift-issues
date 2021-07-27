//
//  IssueDetailsView.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit
import SnapKit

class IssueDetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Views Properties
    private lazy var contentView = makeContententView()
    lazy var textView = makeTextView()
    lazy var browserButton = makeButton()
    
    // MARK: - Views Contructors
    private func makeContententView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245, green: 245, blue: 245, alpha: 0.8)
        
        return view
    }
    
    private func makeTextView() -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.textColor = .darkGray
        textView.layer.cornerRadius = 12
        textView.font = .systemFont(ofSize: 24)
        
        return textView
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Open in broswer", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 230, green: 230, blue: 230, alpha: 0.2).cgColor
        button.backgroundColor = .systemBlue
        
        return button
    }
        
    // MARK: - Add Constraints and views
    private func addViews() {
        addSubview(contentView)
        
        contentView.addSubview(textView)
        contentView.addSubview(browserButton)
    }
    
    private func addConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textView.snp.makeConstraints { make in
            make.bottom.equalTo(browserButton.snp.top).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(contentView.snp.topMargin).inset(24)
        }
        
        browserButton.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottomMargin).offset(-32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
    }

}
