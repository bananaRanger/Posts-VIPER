//
//  AppDelegate.swift
//  Posts
//
//  Created by Anton Yereshchenko on 1/31/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = Posts().setup()
    window?.makeKeyAndVisible()
    
    return true
  }

}

