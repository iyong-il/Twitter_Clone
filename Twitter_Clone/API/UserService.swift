//
//  UserService.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/30.
//

import Firebase

struct UserService {
  static let shared = UserService()

  func fetchUser(completion: @escaping (User) -> Void) {
    guard let uid = Auth.auth().currentUser?.uid else { return }

    DB.REF_USERS.child(uid).observeSingleEvent(of: .value) { snapShot in
      // 데이터베이스의 정보를 딕셔너리의 형태로 받기 위해 (username으로 연습)
      guard let dictionary = snapShot.value as? [String: AnyObject] else { return }
//      guard let username = dictionary["username"] as? String else { return }
//      print(#fileID, #function, #line, "- username is \(username)")

      // 데이터베이스의 모든정보를 딕셔너리 형태로 받기위해
      let user = User(uid: uid, dictionary: dictionary)
      completion(user)

//      print(#fileID, #function, #line, "- email is \(user.email)")
//      print(#fileID, #function, #line, "- username is \(user.username)")
//      print(#fileID, #function, #line, "- fullname is \(user.fullname)")
//      print(#fileID, #function, #line, "- imageUrl is \(user.profileImageUrl)")





    }
  }
}
