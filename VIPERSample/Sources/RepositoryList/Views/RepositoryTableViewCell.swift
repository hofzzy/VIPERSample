//
//  RepositoryTableViewCell.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var starsCountLabel: UILabel!
  
  func prepareUI(_ repository: Repository) {
    nameLabel.text = repository.fullName
    descriptionLabel.text = repository.description
    starsCountLabel.text = "★ " + String(repository.starsCount)
  }
}
