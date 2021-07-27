//
//  IssueDetailsViewController.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit
import Nuke

class IssueDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private unowned var screenView: IssueDetailsView { return self.view as! IssueDetailsView }
    private var content: IssueResponseModel!
    
    // MARK: - Init
    convenience init(content: IssueResponseModel) {
        self.init()
        self.content = content
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(content: content)
        
        navigationController?.navigationBar.topItem?.title = nil
    }
    
    override func loadView() {
        view = IssueDetailsView()
    }
    
    // MARK: - Configure Views
    private func configureView(content: IssueResponseModel) {
        screenView.textView.text = content.body
        screenView.titleLabel.text = content.title
        
        let createdAt = content.createdAt.formatDateFrom("yyyy-MM-dd'T'HH:mm:ssZ", to: "dd/MM/yyyy")
        screenView.createdByLabel.text = "Created By: \(content.user.login) - At: \(createdAt)"
        
        Nuke.loadImage(with: content.user.avatarURL, into: screenView.imageView)
        
        screenView.browserButton.addTarget(self, action: #selector(didTouchOpenOnBrowserButton), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc private func didTouchOpenOnBrowserButton() {
        UIApplication.shared.open(content.htmlURL)
    }
}
