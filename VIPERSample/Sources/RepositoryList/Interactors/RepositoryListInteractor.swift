//
//  RepositoryListInteractor.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import Alamofire
import SwiftyJSON

protocol RepositoryListInteractorInput: class {
  var presenter: RepositoryListInteractorOutput? { get set }
  
  func fetchRepositories()
}



class RepositoryListInteractor: RepositoryListInteractorInput {
  weak var presenter: RepositoryListInteractorOutput?
  
  let searchAPI = "https://api.github.com/search/repositories"
  let parameters: Parameters = ["q": "language:swift",
                                "sort": "stars",
                                "order": "desc",
                                "per_page": 20]
  
  func fetchRepositories() {
    guard let url = URL(string: searchAPI) else { return }
    Alamofire
      .request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
      .validate(statusCode: 200..<300)
      .validate(contentType: ["application/json"])
      .responseData { response in
        switch response.result {
        case .success(let data):
          var repositories = [Repository]()
          let repositoriesJSON = JSON(data)["items"].arrayValue
          repositoriesJSON.forEach {
            repositories.append(Repository(json: $0))
          }
          self.presenter?.didFetchRepositories(repositories)
        case .failure(let error):
          print("❌ データの取得に失敗しました。\(error)")
          break
        }
      }
  }
}

