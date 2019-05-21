//
//  NetworkService.swift
//  Posts
//
//  Created by Anton Yereshchenko on 1/31/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import UIKit

class NetworkService {

  private let network: Network
  private let urlString = "https://jsonplaceholder.typicode.com"
  
  init() {
    self.network = Network()
  }
  
  func posts(completion: @escaping ([PostEntity]?, Error?) -> ()) {
    let request = "posts"
    
    guard let url = URL(string: urlString)?.appendingPathComponent(request) else {
      completion(nil, nil)
      return
    }

    network.get(with: url) { (data, error) in
      guard error == nil else {
        completion(nil, error)
        return
      }
      
      guard let data = data else {
        completion(nil, nil)
        return
      }
      
      do {
        let posts = try JSONDecoder().decode([PostEntity].self, from: data)
        completion(posts, nil)
      } catch {
        completion(nil, error)
      }
    }
  }
  
  func post(completion: @escaping (PostEntity?, Error?) -> ()) {
    let request = "post"
    
    guard let url = URL(string: urlString)?.appendingPathComponent(request) else {
      completion(nil, nil)
      return
    }
    
    network.get(with: url) { (data, error) in
      guard error == nil else {
        completion(nil, error)
        return
      }
      
      guard let data = data else {
        completion(nil, nil)
        return
      }
      
      do {
        let post = try JSONDecoder().decode(PostEntity.self, from: data)
        completion(post, nil)
      } catch {
        completion(nil, error)
      }
    }
  }
  
  func user(with id: Int, completion: @escaping (UserEntity?, Error?) -> ()) {
    let request = "users".appending("/").appending(String(id))
    
    guard let url = URL(string: urlString)?.appendingPathComponent(request) else {
      completion(nil, nil)
      return
    }
    
    network.get(with: url) { (data, error) in
      guard error == nil else {
        completion(nil, error)
        return
      }
      
      guard let data = data else {
        completion(nil, nil)
        return
      }
      
      do {
        let user = try JSONDecoder().decode(UserEntity.self, from: data)
        completion(user, nil)
      } catch {
        completion(nil, error)
      }
    }
  }
  
}

