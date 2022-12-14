//
//  Constants.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/29.
//

import Foundation
import Firebase


struct DB {
  static let DB_REF = Database.database().reference()
  static let REF_USERS = DB_REF.child("users")
  static let REF_TWEETS = DB_REF.child("tweets")
  
  private init() {}
}

struct STORAGE {
  static let STORAGE_REF = Storage.storage().reference()
  static let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

  private init() {}
}
