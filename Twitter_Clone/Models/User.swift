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

    // 인스턴스생성시 url을 문자열이 아닌 URL로 받을 수 있게 해주기 위해
    if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
      guard let url = URL(string: profileImageUrlString) else { return }
      self.profileImageUrl = url
    }
  }
}
