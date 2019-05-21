//
//  User.swift
//  Posts
//
//  Created by Anton Yereshchenko on 1/31/19.
//  Copyright © 2019 Anton Yereshchenko. All rights reserved.
//

import Foundation

class UserEntity: Codable {
  let id: Int
  let name: String
  let username: String
  let email: String
  let address: AddressEntity
  let phone, website: String
  let company: CompanyEntity
}

class AddressEntity: Codable {
  let street: String
  let suite: String
  let city: String
  let zipcode: String
  let geo: GeoEntity
}

class GeoEntity: Codable {
  let lat: String
  let lng: String
}

class CompanyEntity: Codable {
  let name: String
  let catchPhrase: String
  let bs: String
}
