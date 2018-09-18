//
//  RepositoryDetailPresenter.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import UIKit

protocol RepositoryDetailPresenterInput: class {
  var view: RepositoryDetailViewInput? { get set }
  var interactor: RepositoryDetailInteractorInput? { get set }
  var router: RepositoryDetailRouterInput? { get set }
  
  var repository: Repository? { get set }
}

protocol RepositoryDetailViewOutput: class {
  func prepareUI()
}

protocol RepositoryDetailInteractorOutput: class {
  func didFetchAvatarImage(_ image: UIImage)
}

class RepositoryDetailPresenter: RepositoryDetailPresenterInput {
  weak var view: RepositoryDetailViewInput?
  var interactor: RepositoryDetailInteractorInput?
  var router: RepositoryDetailRouterInput?
  
  var repository: Repository?
}

extension RepositoryDetailPresenter: RepositoryDetailViewOutput {
  func prepareUI() {
    guard let repository = repository else { return }
    view?.prepareUI(with: repository)
    interactor?.fetchAvatarImage(from: repository.avatorURL)
  }
}

extension RepositoryDetailPresenter: RepositoryDetailInteractorOutput {
  func didFetchAvatarImage(_ image: UIImage) {
    view?.showAvatarImage(image)
  }
}
