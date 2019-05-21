//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostsContract.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import UIKit

//MARK: - PostsView protocol
protocol PostsView: NKSVView where PresenterType == PostsPresentation {
  func reloadData()
}

//MARK: - PostsPresentation protocol
protocol PostsPresentation: class {
  var numberOfRowsInSection: Int { get }
  var cellModel: CellAnyViewModel.Type { get }

  func viewDidLoad()
  func model(with indexPath: IndexPath) -> CellAnyViewModel?
  func selectCell(with indexPath: IndexPath)
}

//MARK: - PostsUseCase
protocol PostsUseCase: class {
  var posts: [PostEntity] { get }
  func requestPosts()
}

//MARK: - PostsInteractorOutput
protocol PostsInteractorOutput: class {
  func updatePosts(_ posts: [PostEntity])
  func receivedError(_ error: Error?)
}

//MARK: - PostsWireframe
protocol PostsWireframe: class {
  func showDetail(about post: PostEntity)
}


