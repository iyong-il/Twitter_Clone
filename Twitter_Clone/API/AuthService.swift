//
//  AuthService.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/29.
//

import UIKit
import Firebase

struct AuthCredentials {
  let profileImage: UIImage

  let email: String
  let password: String
  let fullname: String
  let username: String
}

struct AuthService {
  static let shared = AuthService()

  typealias LogError = (AuthDataResult?, Error?) -> Void
  typealias RegisterError = (DatabaseReference, Error) -> Void

  func logUserIn(email: String, password: String, completion: @escaping LogError) {
    Auth.auth().signIn(withEmail: email, password: password, completion: completion)
  }

  func registerUser(credential: AuthCredentials, completion: @escaping RegisterError) {
    let profileImage = credential.profileImage
    let email = credential.email
    let password = credential.password
    let fullname = credential.fullname
    let username = credential.username

    guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
    let filename = NSUUID().uuidString
    let storageRef = STORAGE.STORAGE_PROFILE_IMAGES.child(filename)

    // 파이어베이스 storage
    storageRef.putData(imageData, metadata: nil) { (meta, error) in
      storageRef.downloadURL { (url, error) in

        if let error = error {
          print(#fileID, #function, #line, "- \(error.localizedDescription)")

        }
        guard let profileImageUrl = url?.absoluteString else { return }


        // 파이어베이스 auth
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
          if let error = error {
            print(error.localizedDescription)
            return
          }

          // 파이어베이스 database
          guard let uid = result?.user.uid else { return }
          let values = ["email": email, "username": username, "fullname": fullname, "profileImageUrl": profileImageUrl]

          DB.REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
            print("")
          }



        }
      }



    }
  }
}
