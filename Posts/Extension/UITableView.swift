//
//  UITableView.swift
//  Posts
//
//  Created by Anton Yereshchenko on 2/1/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit

extension UITableView {
  
  func dequeueReusableCell(with model: CellAnyViewModel, for indexPath: IndexPath) -> UITableViewCell {
    let identifier = String(describing: type(of: model).cellAnyType)
    let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    model.setupAny(cell: cell)
    return cell
  }
  
  func register(nibModels: [CellAnyViewModel.Type], for bundleClass: AnyClass) {
    let bundle = Bundle(for: bundleClass)
    nibModels.forEach {
      let identifier = String(describing: $0.cellAnyType)
      let nib = UINib(nibName: identifier, bundle: bundle)
      register(nib, forCellReuseIdentifier: identifier)
    }
  }
  
}
