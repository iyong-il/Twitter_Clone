//
//  ProfileHeaderViewModel.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/09.
//

import Foundation

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
