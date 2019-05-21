//  🐍NKSmartViper
//  Generated with NKSmartViperCodeGen
//
//  PostViewController.swift
//
//  Created by Anton Yereshchenko
//  Copyright © Anton Yereshchenko. All rights reserved.
//

import UIKit
import MapKit

//MARK: - PostViewController life cycle
class PostViewController: UIViewController {
  
  @IBOutlet weak var lblPostTitle: UILabel!
  @IBOutlet weak var lblPostBody: UILabel!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var lblAuthor: UILabel!
  
  var presenter: PostPresentation?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
}

//MARK: - IBoutlet
extension PostViewController {
  
  @IBAction func btnCloseTouchUpInside(_ sender: Any) {
    presenter?.btnCloseTouchUpInside()
  }
  
}

//MARK: - PostView protocol implementation
extension PostViewController: PostView {
  
  func setPost(_ post: PostEntity) {
    lblPostTitle.text = post.title
    lblPostBody.text = post.body
  }
  
  func setUser(_ user: UserEntity) {
    guard let lat = CLLocationDegrees(user.address.geo.lat),
      let lng = CLLocationDegrees(user.address.geo.lng) else {
        return
    }
    
    let point = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    mapView.setCenter(point, animated: true)
    
    lblAuthor.text = user.name
  }
  
}




