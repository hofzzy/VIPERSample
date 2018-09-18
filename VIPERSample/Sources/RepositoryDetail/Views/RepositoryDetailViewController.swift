//
//  RepositoryDetailViewController.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import Alamofire
import UIKit

protocol RepositoryDetailViewInput: class {
  func prepareUI(with repository: Repository)
  func showAvatarImage(_ image: UIImage)
}

class RepositoryDetailViewController: UIViewController {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var starsCountLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var presenter: RepositoryDetailViewOutput?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.prepareUI()
  }
}

extension RepositoryDetailViewController: RepositoryDetailViewInput {
  func prepareUI(with repository: Repository) {
    navigationItem.title = repository.name
    
    nameLabel.text = repository.fullName
    starsCountLabel.text = "★ " + String(repository.starsCount)
    descriptionLabel.text = repository.description
  }
  
  func showAvatarImage(_ image: UIImage) {
    avatarImageView.image = image
  }
}
