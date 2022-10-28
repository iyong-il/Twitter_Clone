//
//  SceneDelegate.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)

    // 탭바컨트롤러의 생성
    let tabBarVC = MainTabBarController()

    // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
    let vc1 = UINavigationController(rootViewController: FeedViewController())
    let vc2 = UINavigationController(rootViewController: ExploreViewController())
    let vc3 = UINavigationController(rootViewController: NotificationViewController())
    let vc4 = UINavigationController(rootViewController: ConversationsViewController())

    // 네비게이션바 설정
    [vc1, vc2, vc3, vc4].forEach {
      let appearance = UINavigationBarAppearance()
      appearance.configureWithOpaqueBackground()
      appearance.backgroundColor = .white
      $0.navigationBar.tintColor = .systemBlue
      $0.navigationBar.standardAppearance = appearance
      $0.navigationBar.compactAppearance = appearance
      $0.navigationBar.scrollEdgeAppearance = appearance
    }

    // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
    tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
    tabBarVC.modalPresentationStyle = .fullScreen
    tabBarVC.tabBar.backgroundColor = .white

    // 탭바 이미지 설정 (이미지 리터럴)
    guard let items = tabBarVC.tabBar.items else { return }
    items[0].image = #imageLiteral(resourceName: "home_unselected")
    items[1].image = #imageLiteral(resourceName: "search_unselected")
    items[2].image = #imageLiteral(resourceName: "like_unselected")
    items[3].image = #imageLiteral(resourceName: "mail")

    // 기본루트뷰를 탭바컨트롤러로 설정⭐️⭐️⭐️
    window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

