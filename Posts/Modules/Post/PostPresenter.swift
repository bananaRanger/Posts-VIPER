//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostPresenter.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import Foundation

//MARK: - PostPresentation
class PostPresenter: NKSVPresenter<PostViewController, PostRouter> {
  
  weak var view: PostViewController?
  var router: PostWireframe?
  lazy var interactor: PostUseCase = {
    return PostInteractor(output: self )
  }()
  
  required init<ViewType, RouterType>(view: ViewType, router: RouterType) {
    super.init(view: view, router: router)
    self.view = view as? PostViewController
    self.router = router as? PostWireframe
  }
  
  deinit {
    debugPrint("[Post] Presenter has been deinited")
  }
  
}

//MARK: - PostPresentation protocol implementation
extension PostPresenter: PostPresentation {
  func viewDidLoad() {
    if let post = interactor.post {
      interactor.requestUser(with: post.userId)
      view?.setPost(post)
    }
  }
  
  func btnCloseTouchUpInside() {
    router?.dismiss()
  }
}

//MARK: - PostInteractorOutput protocol implementation
extension PostPresenter: PostInteractorOutput {
  
  func updateUser(_ user: UserEntity) {
    view?.setUser(user)
  }
  
  func receivedError(_ error: Error?) {
    print(error?.localizedDescription ?? "error")
  }
  
}
