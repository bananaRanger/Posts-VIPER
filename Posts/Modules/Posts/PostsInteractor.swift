//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostsInteractor.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import Foundation

//MARK: - PostsInteractor
class PostsInteractor: NKSVInteractor<PostsPresenter> {
  
  private var _posts: [PostEntity] = [PostEntity]()
  
  weak var output: PostsInteractorOutput?
  
  let network: NetworkService?
  
  required init(output: InteractorOutputType?) {
    self.network = NetworkService()
    super.init(output: output)
    self.output = output
  }
}

//MARK: - PostsUseCase protocol implementation
extension PostsInteractor: PostsUseCase {
  
  var posts: [PostEntity] {
    return self._posts
  }
  
  func requestPosts() {
    network?.posts(completion: { (posts, error) in
      DispatchQueue.main.async {
        guard error == nil else {
          self.output?.receivedError(error)
          return
        }
        
        guard let posts = posts else {
          self.output?.receivedError(error)
          return
        }

        self._posts = posts
        self.output?.updatePosts(posts)
      }
    })
  }
  
}
