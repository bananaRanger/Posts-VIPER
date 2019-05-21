//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostRouter.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import UIKit

//MARK: - PostViewController
class PostRouter: NKSVRouter<PostViewController> {}

//MARK: - PostWireframe protocol implementation
extension PostRouter: PostWireframe {
  
  func dismiss() {
    viewController?.dismiss(animated: true, completion: nil)
  }

}
