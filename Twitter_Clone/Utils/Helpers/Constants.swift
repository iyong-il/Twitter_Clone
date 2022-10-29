//
//  Constants.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/29.
//

import Firebase

enum DB {
  static let DB_REF = Database.database().reference()
  static let REF_USERS = DB_REF.child("users")
}
