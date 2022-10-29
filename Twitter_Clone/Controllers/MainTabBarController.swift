//
//  MainTabBarController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit
import Firebase

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
      self.view.backgroundColor = UIColor.twitterBlue
      setupUI()
      authenticationUserAndSetupUI()
//      logUserOut()

    }

  // MARK: - 메서드
  // UI
  private func setupUI() {
    self.view.addSubview(actionButton)

    actionButton.anchor(bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 64, paddingRight: 16,width: 56, height: 56)
    actionButton.layer.cornerRadius = 56 / 2
  }

  // 로그인 되었는지 검사
  func authenticationUserAndSetupUI() {
    if Auth.auth().currentUser == nil {
      // UI담당은 메인큐에서 한다.
      DispatchQueue.main.async {
        let vc = UINavigationController(rootViewController: LoginViewController())
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
      }
    } else {
      setupUI()
    }
  }

  // 강제 로그아웃
  func logUserOut() {
    do {
      try Auth.auth().signOut()
      print(#fileID, #function, #line, "- 로그아웃 되었습니다.")

    } catch let error {
      print(error.localizedDescription)
    }
  }

  // MARK: - 셀렉터
  // 오른쪽 하단 동그라미버튼
  @objc func actionButtonTapped() {

  }



}
