//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostsRouter.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import UIKit

//MARK: - PostsViewController
class PostsRouter: NKSVRouter<PostsViewController> {}

//MARK: - PostsWireframe protocol implementation
extension PostsRouter: PostsWireframe {
  
  func showDetail(about post: PostEntity) {
    let postModule = Post().setup()
    (postModule.presenter as! PostPresenter).interactor.post = post
    viewController?.present(postModule, animated: true, completion: nil)
  }
  
}
