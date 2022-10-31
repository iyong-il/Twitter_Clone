//
//  TweetService.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/31.
//

import Firebase

struct TweetService {
  static let shared = TweetService()

  typealias DataError = (Error?, DatabaseReference) -> Void

  func uploadTweet(caption: String, completion: @escaping DataError) {
    guard let uid = Auth.auth().currentUser?.uid else { return }

    let values = ["uid": uid,
                  "timestamp": Int(NSDate().timeIntervalSince1970),
                  "likes": 0,
                  "retweet": 0,
                  "caption": caption] as [String : Any]

    DB.REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
  }
}
