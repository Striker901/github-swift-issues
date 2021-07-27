//
//  HomeViewController.swift
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

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private let viewModel = HomeViewModel()
    private unowned var screenView: HomeView { return self.view as! HomeView }
    var reloadTableView: Bool = false { didSet { screenView.tableView.reloadData() } }
    private var response: IssuesResponseModel? { if let response = viewModel.response { return response } else { return nil} }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.tableView.configureTableView(delegate: self, dataSource: self)
        configureNavigationBar(title: "Issues list from Swift repository", largeTitleDisplayMode: .always)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.homeIssuesList(viewController: self, completion: { self.reloadTableView = $0 })
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let response = response else { return }
        let detailsViewController = IssueDetailsViewController(details: response[indexPath.row].body)
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
    
}
