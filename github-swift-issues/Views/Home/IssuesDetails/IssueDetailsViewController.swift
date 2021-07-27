//
//  IssueDetailsViewController.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit

class IssueDetailsViewController: UIViewController {
    
    private unowned var screenView: IssueDetailsView { return self.view as! IssueDetailsView }
    private var details: String! { didSet { screenView.textView.text = details } }
    
    convenience init(details: String) {
        self.init()
        self.details = details
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.textView.text = details
    }
    
    override func loadView() {
        view = IssueDetailsView()
    }

}
