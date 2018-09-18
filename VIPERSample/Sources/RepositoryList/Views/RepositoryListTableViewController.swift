//
//  RepositoryListTableViewController.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import UIKit

protocol RepositoryListViewType: class {
  func update(with repositories: [Repository])
}

class RepositoryListTableViewController: UITableViewController {
  var repositories = [Repository]()
  var presenter: RepositoryListPresenterOutput?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.prepareUI()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositories.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "repository", for: indexPath) as! RepositoryTableViewCell
    cell.prepareUI(repositories[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.showRepositoryDetail(with: repositories[indexPath.row])
  }
}

extension RepositoryListTableViewController: RepositoryListViewType {
  func update(with repositories: [Repository]) {
    self.repositories = repositories
    tableView.reloadData()
  }
}
