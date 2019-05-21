//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostLocalizer.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import Foundation

//MARK: - PostLocalizer
class PostLocalizer: NKSVLocalizer<Post> {
  typealias LanguageKey = NKSVLocalizer<Post>.LanguageKey
  
  //MARK: PostLocalizer.LocalizedKey
  enum LocalizedKey: String, Equatable {
    #warning("Fill enum with needed keys")
    //TODO: Fill enum with needed keys
    case replaceMe
  }
  
  func localizedString(for key: LocalizedKey) -> String {
    return localizedString(for:key.rawValue)
  }
}
