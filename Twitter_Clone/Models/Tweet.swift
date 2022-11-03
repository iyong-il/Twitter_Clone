//
//  Tweet.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/03.
//

import Foundation

struct Tweet {
  let caption: String
  let tweetID: String
  let uid: String
  let likes: Int
  var timeStamp: Date!
  let retweetCount: Int

  init(tweetID: String, dictionary: [String: Any]) {
    self.tweetID = tweetID

    self.caption = dictionary["caption"] as? String ?? ""
    self.uid = dictionary["uid"] as? String ?? ""
    self.likes = dictionary["likes"] as? Int ?? 0
    self.retweetCount = dictionary["retweet"] as? Int ?? 0

    if let timeStamp = dictionary["timeStamp"] as? Double {
      self.timeStamp = Date(timeIntervalSince1970: timeStamp)
    }

  }

}
