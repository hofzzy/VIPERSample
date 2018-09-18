//
//  AppDelegate.swift
//  VIPERSample
//
//  Created by hofzzy on 18/09/2018.
//  Copyright © 2018 hofzzy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let repositoryListViewController = RepositoryListRouter.createRepositoryListModules()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = repositoryListViewController
    window?.makeKeyAndVisible()
    
    return true
  }
}

