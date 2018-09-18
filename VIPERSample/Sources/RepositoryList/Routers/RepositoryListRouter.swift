//
//  RepositoryListRouter.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import UIKit

protocol RepositoryListRouterInput {
  static func createRepositoryListModules() -> UIViewController
  func showRepositoryDetail(from view: RepositoryListViewType, with repository: Repository)
}

class RepositoryListRouter: RepositoryListRouterInput {
  static func createRepositoryListModules() -> UIViewController {
    let navigationController = UIStoryboard(name: "RepositoryList", bundle: nil).instantiateInitialViewController() as! UINavigationController
    guard let viewController = navigationController.topViewController as? RepositoryListTableViewController else {
      return UINavigationController()
    }
    let presenter: RepositoryListPresenterInput & RepositoryListPresenterOutput & RepositoryListInteractorOutput = RepositoryListPresenter()
    let interactor: RepositoryListInteractorInput = RepositoryListInteractor()
    let router: RepositoryListRouterInput = RepositoryListRouter()
    
    viewController.presenter = presenter
    presenter.view = viewController
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    
    return navigationController
  }
  
  func showRepositoryDetail(from view: RepositoryListViewType, with repository: Repository) {
    let repositoryDetailController = RepositoryDetailRouter.createRepositoryDetailModules(with: repository)
    
    if let viewController = view as? UIViewController {
      viewController.navigationController?.pushViewController(repositoryDetailController, animated: true)
    }
  }
}
