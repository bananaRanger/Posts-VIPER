//
//  🐍
//
//  NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostContract.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import UIKit

//MARK: - PostView protocol
protocol PostView: NKSVView where PresenterType == PostPresentation {
  func setPost(_ post: PostEntity)
  func setUser(_ user: UserEntity)
}

//MARK: - PostPresentation protocol
protocol PostPresentation: class {
  func viewDidLoad()
  func btnCloseTouchUpInside()
}

//MARK: - PostUseCase
protocol PostUseCase: class {
  var post: PostEntity? { get set }
  
  func requestUser(with id: Int)
}

//MARK: - PostInteractorOutput
protocol PostInteractorOutput: class {
  func updateUser(_ user: UserEntity)
  func receivedError(_ error: Error?)
}

//MARK: - PostWireframe
protocol PostWireframe: class {
  func dismiss()
}


