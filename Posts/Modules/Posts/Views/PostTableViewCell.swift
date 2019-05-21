//
//  PostTableViewCell.swift
//  Posts
//
//  Created by Anton Yereshchenko on 2/1/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblBody: UILabel!
  
  var icon: UIImage? {
    get {
      return self.img.image
    }
    set {
      self.img.image = newValue
    }
  }
  
  var title: String? {
    get {
      return self.lblTitle.text
    }
    set {
      self.lblTitle.text = newValue
    }
  }
  
  var body: String? {
    get {
      return self.lblBody.text
    }
    set {
      self.lblBody.text = newValue
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
}

// MARK: - PostCellModel -

class PostCellModel {
  
  let post: PostEntity
  
  init(with post: PostEntity) {
    self.post = PostEntity(post: post)
  }
  
}

// MARK: - extension PostCellModel -

extension PostCellModel: CellViewModel {
  
  func setup(cell: PostTableViewCell) {
    cell.title = self.post.title
    cell.body = self.post.body
  }
  
}
