//
//  FeedViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "TweetCell"

final class FeedViewController: UICollectionViewController {

  // MARK: - 속성
  var user: User? {
    didSet {
      setupLeftBarButton()
    }
  }

  private var tweets = [Tweet]() {
    didSet {
      self.collectionView.reloadData()

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
    fetchTweets()
    setupCollectionView()
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

  fileprivate func fetchTweets() {
    TweetService.shared.fetchTweets { tweets in
      print(#fileID, #function, #line, "- 트윗 내용: \(tweets)")
      self.tweets = tweets

    }
  }

  fileprivate func setupCollectionView() {
    collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
  }


}

// MARK: - 확장 / 컬렉션뷰 데이터소스
extension FeedViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tweets.count
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell

    cell.tweet = tweets[indexPath.row]
    return cell
  }
}

// MARK: - 확장 / 컬렉션뷰 델리게이트 플로우레이아웃
extension FeedViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 120)
  }
}

// MARK: - 확장 / 미리보기
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
