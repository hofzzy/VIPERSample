//
//  Repository.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import SwiftyJSON

class Repository {
  let name: String
  let fullName: String
  let avatorURL: String
  let description: String
  let starsCount: Int
  
  init(json: JSON) {
    name = json["name"].stringValue
    fullName = json["full_name"].stringValue
    avatorURL = json["owner"]["avatar_url"].stringValue
    description = json["description"].stringValue
    starsCount = json["stargazers_count"].intValue
  }
}
