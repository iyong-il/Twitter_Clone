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
  var user: User? {
    didSet {
      guard let nav = self.viewControllers?[0] as? UINavigationController else { return }
      guard let feed = nav.viewControllers.first as? FeedViewController else { return }
      //      guard let user = user else { return }

      feed.user = user
    }
  }
  
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
    authenticationUserAndSetupUI()
    //      logUserOut()
  }

  // MARK: - 메서드
  // 탭바구성
  fileprivate func setupVC() {
    let feed = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
    let nav1 = templateNavigationController(image: UIImage(named: "home_unselected"), rootVC: feed)

    let explore = ExploreViewController()
    let nav2 = templateNavigationController(image: UIImage(named: "search_unselected"), rootVC: explore)

    let notifications = NotificationViewController()
    let nav3 = templateNavigationController(image: UIImage(named: "like_unselected"), rootVC: notifications)

    let conversations = ConversationsViewController()
    let nav4 = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootVC: conversations)

    viewControllers = [nav1, nav2, nav3, nav4]

    [nav1, nav2, nav3, nav4].forEach {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = .white
      $0.navigationBar.tintColor = .systemBlue
      $0.navigationBar.standardAppearance = appearance
      $0.navigationBar.compactAppearance = appearance
      $0.navigationBar.scrollEdgeAppearance = appearance
    }

    // 탭바경계선
    if #available(iOS 15, *) {
      let appearance = UITabBarAppearance()
      appearance.configureWithOpaqueBackground()
      UITabBar.appearance().standardAppearance = appearance
      UITabBar.appearance().scrollEdgeAppearance = appearance
    }

  }

  // 탭바만들기 메서드
  private func templateNavigationController(image: UIImage?, rootVC: UIViewController) -> UINavigationController {
    let nav = UINavigationController(rootViewController: rootVC)
    nav.tabBarItem.image = image
    nav.navigationBar.barTintColor = .systemBlue

    return nav
  }
  
  // UI
  private func setupUI() {
    self.tabBar.backgroundColor = .white
    self.view.addSubview(actionButton)

    actionButton.anchor(bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 64, paddingRight: 16,width: 56, height: 56)
    actionButton.layer.cornerRadius = 56 / 2
  }

  // MARK: - API
  fileprivate func fetchUser() {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    UserService.shared.fetchUser(uid: uid) { user in
      self.user = user
    }
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
      setupVC()
      fetchUser()
    }
  }

  // 강제 로그아웃
  fileprivate func logUserOut() {
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
    print(#fileID, #function, #line, "- 오른쪽 하단 동그라미 버튼")
    guard let user = user else { return }

    let vc = UploadTweetViewController()
    vc.user = user
    let nav = UINavigationController(rootViewController: vc)
    nav.modalPresentationStyle = .fullScreen
    present(nav, animated: true)

  }



}

#if DEBUG
import SwiftUI

struct MainTabbarViewController_Previews: PreviewProvider {

  static var previews: some View {
    if #available(iOS 14.0, *) {
      MainTabBarController().getPreview()
        .ignoresSafeArea()
    }
  }
}
#endif

