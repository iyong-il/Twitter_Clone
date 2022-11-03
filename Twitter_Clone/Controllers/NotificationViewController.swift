//
//  NotificationViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/29.
//

import UIKit

final class NotificationViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }


  private func setupUI() {
    self.navigationItem.title = "Notification"
    self.view.backgroundColor = .white
  }


}
