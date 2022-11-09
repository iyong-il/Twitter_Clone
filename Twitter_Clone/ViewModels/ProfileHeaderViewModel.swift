//
//  ProfileHeaderViewModel.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/09.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
  case tweets
  case replies
  case likes

  var description: String {
    switch self {
    case .tweets:
      return "Tweets"
    case .replies:
      return "Tweets & Replies"
    case .likes:
      return "Likes"
    }
  }
}

struct ProfileHeaderViewModel {

  private let user: User

  var followersText: NSAttributedString? {
    return attributedText(withValue: 0, text: "followers")
  }

  var followingText: NSAttributedString? {
    return attributedText(withValue: 2, text: "following")
  }

//  var actionButtontitle: String {
//    
//  }



  init(user: User) {
    self.user = user
  }

  private func attributedText(withValue value: Int, text: String) -> NSAttributedString {
    let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])

    attributedTitle.append(NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))

    return attributedTitle
  }
  
}
