//
//  FeedViewController.swift
//  Reddit
//
//  Created by Naveen Sudireddy on 10/13/21.
//  Copyright © 2021 Naveen Sudireddy. All rights reserved.
//

import UIKit

protocol FeedViewControllerDelegate: AnyObject {
    func loadData(list: [ChildrenData])
    func errorLoadingData()
}

final class FeedViewController: UIViewController {

    var tableView: UITableView!
    var delegateAndDataSource: FeedTableViewDelegateAndDataSource?
    var viewModel: FeedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel = FeedViewModel()
        viewModel?.delegate = self
        viewModel?.fetchFeedData()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        let frame = self.view.frame
        tableView = UITableView(frame: frame)

        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
       
        tableView.register(FeedTableviewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = delegateAndDataSource
        tableView.dataSource = delegateAndDataSource

    }

}

extension FeedViewController: FeedViewControllerDelegate {
    func loadData(list: [ChildrenData]) {
        delegateAndDataSource = FeedTableViewDelegateAndDataSource(list)
        tableView.delegate = delegateAndDataSource
        tableView.dataSource = delegateAndDataSource
        tableView.reloadData()
    }
    
    func errorLoadingData() {
        
    }
}
