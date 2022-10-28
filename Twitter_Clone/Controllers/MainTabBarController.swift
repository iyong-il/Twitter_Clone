//
//  MainTabBarController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit

final class MainTabBarController: UITabBarController {

  // MARK: - 속성
  lazy var actionButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .white
    button.backgroundColor = UIColor.twitterBlue
    button.setImage(UIImage(named: "new_tweet"), for: .normal)
    button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)

    return button
  }()

  // MARK: - 라이프 사이클
  // 뷰디드로드
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

  // MARK: - 메서드
  // UI
  private func setupUI() {
    self.view.addSubview(actionButton)

    actionButton.anchor(bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 64, paddingRight: 16,width: 56, height: 56)
    actionButton.layer.cornerRadius = 56 / 2
  }

  // MARK: - 셀렉터
  // 오른쪽 하단버튼
  @objc func actionButtonTapped() {

  }



}
