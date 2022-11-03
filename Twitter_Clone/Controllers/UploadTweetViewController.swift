//
//  UploadTweetViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/31.
//

import UIKit
import SDWebImage

// MARK: - 트윗화면 VC
final class UploadTweetViewController: UIViewController {

  
  // MARK: - 속성
  // 이미지를 받아오기위함
  var user: User? {
    didSet {
      fetchData()
    }
  }

  // 트윗버튼
  private lazy var actionButton: UIButton = {
    let button = UIButton(type:  .system)
    button.backgroundColor = .twitterBlue
    button.setTitle("Tweet", for: .normal)
    button.titleLabel?.textAlignment = .center
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    button.setTitleColor(.white, for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
    button.layer.cornerRadius = button.frame.height / 2
    button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)

    return button
  }()

  // 프로필 이미지
  private lazy var profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .twitterBlue
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.setDimensions(width: 48, height: 48)
    iv.layer.cornerRadius = 48 / 2
    iv.layer.masksToBounds = true

    return iv
  }()

  private lazy var captionTextView = CaptionTextView()

  lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [profileImageView, captionTextView])
    st.axis = .horizontal
    st.spacing = 12

    return st
  }()


  // MARK: - 라이프사이클
  // 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavbar()
    setupUI()

  }

  // MARK: - 메서드
  // 네비게이션바
  private func setupNavbar() {
    title = ""

    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .systemBlue
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.compactAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance

    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
  }

  // UI
  private func setupUI() {
    self.view.backgroundColor = .white

    self.view.addSubview(stack)
    stack.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor,
                 paddingTop: 16, paddingLeft: 16, paddingRight: 16)
  }

  // 이미지 받아오기
  func fetchData() {
    guard let user = user,
          let url = user.profileImageUrl else { return }
    profileImageView.sd_setImage(with: url)
  }

  // MARK: - 셀렉터
  // 네비게이션바 왼쪽 취소버튼
  @objc func handleCancel() {
    dismiss(animated: true)
  }

  // 네비게이션바 오른쪽 트윗버튼
  @objc func handleUploadTweet() {
//    print(#fileID, #function, #line, "- 트윗버튼이 눌렸다.")
    guard let caption = captionTextView.text else { return }
    TweetService.shared.uploadTweet(caption: caption) { (error, ref) in
      if let error = error {
        print(#fileID, #function, #line, "- \(error.localizedDescription)")

        return
      }
      self.dismiss(animated: true)
    }
  }


}
