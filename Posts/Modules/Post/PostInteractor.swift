//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostInteractor.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import Foundation

//MARK: - PostInteractor
class PostInteractor: NKSVInteractor<PostPresenter> {
  weak var output: PostInteractorOutput?
  
  private var _user: UserEntity?
  private var _post: PostEntity?

  let network: NetworkService?

  required init(output: InteractorOutputType?) {
    self.network = NetworkService()
    super.init(output: output)
    self.output = output
  }
}

//MARK: - PostUseCase protocol implementation
extension PostInteractor: PostUseCase {
  
  var post: PostEntity? {
    get {
      return self._post
    }
    set {
      self._post = newValue
    }
  }
  
  func requestUser(with id: Int) {
    network?.user(with: id, completion: { (user, error) in
      DispatchQueue.main.async {
        guard error == nil else {
          self.output?.receivedError(error)
          return
        }
        
        guard let user = user else {
          self.output?.receivedError(error)
          return
        }

        self._user = user
        self.output?.updateUser(user)
      }
    })
  }
  
}
