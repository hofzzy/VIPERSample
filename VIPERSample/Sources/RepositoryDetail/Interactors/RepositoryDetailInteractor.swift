//
//  RepositoryDetailInteractor.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import Alamofire
import AlamofireImage

protocol RepositoryDetailInteractorInput: class {
  var presenter: RepositoryDetailInteractorOutput? { get set }
  
  func fetchAvatarImage(from url: String)
}

class RepositoryDetailInteractor: RepositoryDetailInteractorInput {
  weak var presenter: RepositoryDetailInteractorOutput?
  
  func fetchAvatarImage(from url: String) {
    Alamofire.request(url).responseImage { [weak self] response in
      if let image = response.result.value {
        self?.presenter?.didFetchAvatarImage(image)
      }
    }
  }
}
