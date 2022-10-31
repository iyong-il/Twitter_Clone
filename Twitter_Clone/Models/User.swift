//
//  User.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/30.
//

import UIKit

struct User {
  let uid: String
  let email: String
  let fullname: String
  let username: String
  var profileImageUrl: URL?

  init(uid: String, dictionary: [String: AnyObject]) {
    self.uid = uid
    self.email = dictionary["email"] as? String ?? ""
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.username = dictionary["username"] as? String ?? ""

    if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
      guard let url = URL(string: profileImageUrlString) else { return }
      self.profileImageUrl = url
    }
  }
}