//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostsLocalizer.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import Foundation

//MARK: - PostsLocalizer
class PostsLocalizer: NKSVLocalizer<Posts> {
  typealias LanguageKey = NKSVLocalizer<Posts>.LanguageKey
  
  //MARK: PostsLocalizer.LocalizedKey
  enum LocalizedKey: String, Equatable {
    #warning("Fill enum with needed keys")
    //TODO: Fill enum with needed keys
    case replaceMe
  }
  
  func localizedString(for key: LocalizedKey) -> String {
    return localizedString(for:key.rawValue)
  }
}
