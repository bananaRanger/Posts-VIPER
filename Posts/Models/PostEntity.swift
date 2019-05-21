//
//  PostEntity.swift
//  Posts
//
//  Created by Anton Yereshchenko on 1/31/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import Foundation

class PostEntity: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
  
  init(post: PostEntity) {
    self.userId = post.userId
    self.id = post.id
    self.title = post.title
    self.body = post.body
  }
  
}
