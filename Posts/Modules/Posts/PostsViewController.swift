//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostsViewController.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import UIKit

//MARK: - PostsViewController life cycle
class PostsViewController: UIViewController {
 
  @IBOutlet weak var tableView: UITableView!
  
  var presenter: PostsPresentation?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    if let cell = presenter?.cellModel {
      tableView.register(nibModels: [cell], for: PostsViewController.self)
    }
  }
  
}

//MARK: - PostsView protocol implementation
extension PostsViewController: PostsView {
  
  func reloadData() {
    tableView.reloadData()
  }
  
}

//MARK: - UITableViewDataSource
extension PostsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter?.selectCell(with: indexPath)
  }
  
}

//MARK: - UITableViewDataSource
extension PostsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.numberOfRowsInSection ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let model = presenter?.model(with: indexPath) {
      return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
    return UITableViewCell()
  }
  
}
