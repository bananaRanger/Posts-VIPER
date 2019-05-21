//
//  CellViewModel.swift
//  Posts
//
//  Created by Anton Yereshchenko on 2/1/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit

protocol CellAnyViewModel {
  static var cellAnyType: UIView.Type { get }
  func setupAny(cell: UIView)
}

protocol CellViewModel: CellAnyViewModel {
  associatedtype CellType: UIView
  func setup(cell: CellType)
}

extension CellViewModel {
  static var cellAnyType: UIView.Type {
    return CellType.self
  }
  func setupAny(cell: UIView) {
    if let cell = cell as? CellType {
      setup(cell: cell)
    } else {
      assertionFailure("Error: \(#function) \(#file) \(#line)")
    }
  }
}
