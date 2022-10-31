//
//  FeedViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit
import SDWebImage

final class FeedViewController: UIViewController {

  // MARK: - 속성

  var user: User? {
    didSet {
      setupLeftBarButton()
    }
  }
  // 타이틀 이미지
  private lazy var imageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "twitter_logo_blue"))
    iv.setDimensions(width: 44, height: 44)
    iv.contentMode = .scaleAspectFit

    return iv
  }()

  private let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.setDimensions(width: 32, height: 32)
    iv.layer.cornerRadius = 32 / 2
    iv.layer.masksToBounds = true

    return iv
  }()

  // MARK: - 라이프사이클
  // 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()

  }

  // MARK: - 메서드
  // UI
  fileprivate func setupUI() {
    self.view.backgroundColor = .white
    self.navigationItem.titleView = imageView
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)

  }

  fileprivate func setupLeftBarButton() {
    guard let user = user,
          let url = user.profileImageUrl else { return }

    profileImageView.sd_setImage(with:  url, completed: nil)

  }




}

#if DEBUG
import SwiftUI

struct FeedViewController_Previews: PreviewProvider {

  static var previews: some View {
    if #available(iOS 14.0, *) {
      FeedViewController().getPreview()
        .ignoresSafeArea()
    }

  }
}
#endif
