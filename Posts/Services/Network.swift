//
//  Network.swift
//  Posts
//
//  Created by Anton Yereshchenko on 1/31/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit

class Network {
  
  func get(with url: URL, completion: @escaping (Data?, Error?) -> ()) {
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
        
    dataTask = session.dataTask(with: url) { data, response, error in
      if let error = error {
          completion(nil, error)
      } else if let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode == 200 {
          completion(data, nil)
      }
    }
    dataTask?.resume()
  }
  
}
