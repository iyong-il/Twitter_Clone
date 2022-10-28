//
//  RegistrationViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit

final class RegistrationViewController: UIViewController {

  // MARK: - 속성



  // MARK: - 라이프사이클
  // 뷰디드로드
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

  // MARK: - 메서드
  // UI
  private func setupUI() {
    self.view.backgroundColor = UIColor.twitterBlue
  }

}
