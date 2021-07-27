//
//  IssueDetailsView.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit
import SnapKit

class IssueDetailsView: UIView {
    
    // MARK: - Init
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
    lazy var imageView = makeImageView()
    lazy var titleLabel = makeLabel(alignment: .center, font: .systemFont(ofSize: 24), color: .darkGray)
    lazy var createdByLabel = makeLabel(alignment: .right, font: .systemFont(ofSize: 14), color: .lightGray)
    
    // MARK: - Views Contructors
    private func makeLabel(alignment: NSTextAlignment, font: UIFont, color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        label.numberOfLines = 0
        label.textAlignment = alignment
        
        return label
    }
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 24
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    private func makeContententView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light_white")
        
        return view
    }
    
    private func makeTextView() -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.textColor = .darkGray
        textView.layer.cornerRadius = 12
        textView.font = .systemFont(ofSize: 16)
        
        return textView
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Open in broswer", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "light_gray")?.cgColor
        button.backgroundColor = .systemBlue
        
        return button
    }
        
    // MARK: - Add Constraints and views
    private func addViews() {
        addSubview(contentView)
        
        contentView.addSubview(createdByLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textView)
        contentView.addSubview(browserButton)
    }
    
    private func addConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        createdByLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.bottom.equalTo(imageView)
            make.trailing.equalTo(imageView.snp.leading).inset(-8)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.topMargin).inset(8)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
        
        textView.snp.makeConstraints { make in
            make.bottom.equalTo(browserButton.snp.top).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        
        browserButton.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottomMargin).offset(-32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
    }
}
