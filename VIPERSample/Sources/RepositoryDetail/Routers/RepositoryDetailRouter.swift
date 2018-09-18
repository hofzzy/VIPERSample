//
//  RepositoryDetailRouter.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import UIKit

protocol RepositoryDetailRouterInput: class {
  static func createRepositoryDetailModules(with repository: Repository) -> UIViewController
}

class RepositoryDetailRouter: RepositoryDetailRouterInput {
  static func createRepositoryDetailModules(with repository: Repository) -> UIViewController {
    let viewController = UIStoryboard(name: "RepositoryDetail", bundle: nil).instantiateInitialViewController() as! RepositoryDetailViewController

    let presenter: RepositoryDetailPresenterInput & RepositoryDetailViewOutput & RepositoryDetailInteractorOutput = RepositoryDetailPresenter()
    let interactor: RepositoryDetailInteractorInput = RepositoryDetailInteractor()
    let router: RepositoryDetailRouterInput = RepositoryDetailRouter()

    viewController.presenter = presenter
    presenter.view = viewController
    presenter.interactor = interactor
    presenter.router = router
    presenter.repository = repository
    interactor.presenter = presenter

    return viewController
  }
}
