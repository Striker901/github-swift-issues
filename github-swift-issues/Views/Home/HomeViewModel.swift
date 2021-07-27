//
//  HomeViewModel.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation
import UIKit

final class HomeViewModel {
    typealias IssuesListCompletion = (IssuesResponseModel?, _ error: String?) -> Void
    typealias BoolCompletion = (Bool) -> Void
    private(set) var response: IssuesResponseModel?
    
    func homeIssuesList(viewController: UIViewController, completion: @escaping BoolCompletion) {
        homeIssuesList { [weak self] response, error in
            guard let self = self else { return }
            if let response = response {
                self.response = response
                completion(true)
            } else if let error = error {
                let alert = UIAlertController(title: "Ops!", message: error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in viewController.dismiss(animated: true)}))
                alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in self.homeIssuesList(viewController: viewController, completion: completion)}))
                viewController.present(alert, animated: true)
            }
        }
    }
    
    private func homeIssuesList(completion: @escaping IssuesListCompletion) {
        HomeAPI().issuesList { result in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil ,error.localizedDescription)
            }
        }
    }
}
