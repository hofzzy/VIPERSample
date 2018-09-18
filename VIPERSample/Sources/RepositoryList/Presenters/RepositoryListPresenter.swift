//
//  RepositoryListPresenter.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import Foundation

protocol RepositoryListPresenterInput: class {
  var view: RepositoryListViewType? { get set }
  var interactor: RepositoryListInteractorInput? { get set }
  var router: RepositoryListRouterInput? { get set }
}

protocol RepositoryListPresenterOutput: class {
  func prepareUI()
  func showRepositoryDetail(with repository: Repository)
}

protocol RepositoryListInteractorOutput: class {
  func didFetchRepositories(_ repositories: [Repository])
}

class RepositoryListPresenter: RepositoryListPresenterInput {
  weak var view: RepositoryListViewType?
  var interactor: RepositoryListInteractorInput?
  var router: RepositoryListRouterInput?
}

extension RepositoryListPresenter: RepositoryListPresenterOutput {
  func prepareUI() {
    interactor?.fetchRepositories()
  }
  
  func showRepositoryDetail(with repository: Repository) {
    router?.showRepositoryDetail(from: view!, with: repository)
  }
}

extension RepositoryListPresenter: RepositoryListInteractorOutput {
  func didFetchRepositories(_ repositories: [Repository]) {
    view?.update(with: repositories)
  }
}
