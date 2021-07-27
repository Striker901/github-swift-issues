//
//  HomeViewController.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import UIKit
import SwiftSpinner

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private let viewModel = HomeViewModel()
    private unowned var screenView: HomeView { return self.view as! HomeView }
    var reloadTableView: Bool = false { didSet { screenView.tableView.reloadData() } }
    private var response: IssuesResponseModel? { if let response = viewModel.response { return response } else { return nil} }
    
    let refreshControl = UIRefreshControl()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureTableView(response: response)
        configureNavigationBar(title: "Issues list from Swift repository", largeTitleDisplayMode: .always)
    }
    
    // MARK: - Configure View
    override func loadView() {
        view = HomeView()
    }
    
    private func configureTableView(response: IssuesResponseModel?) {
        if response == nil {
            SwiftSpinner.show("Loading", animated: true)
            viewModel.homeIssuesList(viewController: self) { [weak self] shouldReload in
                guard let self = self else { return }
                self.reloadTableView = shouldReload
                SwiftSpinner.hide()
            }
        }
    }
    
    private func configureViews() {
        screenView.tableView.configureTableView(delegate: self, dataSource: self)
        
        refreshControl.attributedTitle = NSAttributedString(string: "Updating", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "light_lead")!])
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        screenView.tableView.addSubview(refreshControl)
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let response = response else { return }
        let detailsViewController = IssueDetailsViewController(content: response[indexPath.row])
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let response = response { return response.count } else { return 0}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Default cell")
        
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        
        guard let response = response else { return cell }
        
        cell.textLabel?.text = response[indexPath.row].title
        cell.detailTextLabel?.text = "Status: " + response[indexPath.row].state.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    // MARK: - Action
    @objc func refresh() {
        viewModel.homeIssuesList(viewController: self) { [weak self] shouldReload in
            guard let self = self else { return }
            self.reloadTableView = shouldReload
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.refreshControl.endRefreshing()
            }
        }
    }
}
