//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostsPresenter.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import Foundation

//MARK: - PostsPresentation
class PostsPresenter: NKSVPresenter<PostsViewController, PostsRouter> {
  
  weak var view: PostsViewController?
  var router: PostsWireframe?
  lazy var interactor: PostsUseCase = {
    return PostsInteractor(output: self )
  }()
  
  required init<ViewType, RouterType>(view: ViewType, router: RouterType) {
    super.init(view: view, router: router)
    self.view = view as? PostsViewController
    self.router = router as? PostsWireframe
  }
  
  deinit {
    debugPrint("[Posts] Presenter has been deinited")
  }
  
}

//MARK: - PostsPresentation protocol implementation
extension PostsPresenter: PostsPresentation {
  
  var numberOfRowsInSection: Int {
    return interactor.posts.count
  }
  
  var cellModel: CellAnyViewModel.Type {
    return PostCellModel.self
  }
  
  func viewDidLoad() {
    interactor.requestPosts()
  }
  
  func model(with indexPath: IndexPath) -> CellAnyViewModel? {
    if interactor.posts.count > indexPath.row {
      let post = interactor.posts[indexPath.row]
      return PostCellModel(with: post)
    }
    return nil
  }
  
  func selectCell(with indexPath: IndexPath) {
    if interactor.posts.count > indexPath.row {
      let post = interactor.posts[indexPath.row]
      router?.showDetail(about: post)
    }
  }
  
}

//MARK: - PostsInteractorOutput protocol implementation
extension PostsPresenter: PostsInteractorOutput {
  
  func updatePosts(_ posts: [PostEntity]) {
    if posts.count > 0 {
      view?.reloadData()
    }
  }
  
  func receivedError(_ error: Error?) {
    print(error?.localizedDescription ?? "error")
  }
  
}
