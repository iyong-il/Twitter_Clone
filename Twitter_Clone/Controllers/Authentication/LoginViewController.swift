//
//  LoginViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit

final class LoginViewController: UIViewController {

  // MARK: - 속성
  // 상단 로고 이미지
  private lazy var logoImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.image = #imageLiteral(resourceName: "TwitterLogo")

    return iv
  }()

  private let emailContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    view.anchor(height: 50)

    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "mail")

    view.addSubview(iv)
    iv.tintColor = .white
    iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
    iv.setDimensions(width: 24, height: 24)

    return view
  }()

  private let passwordContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemYellow
//    view.anchor(height: 50)

    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")

    view.addSubview(iv)
    iv.tintColor = .white
    iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
    iv.setDimensions(width: 24, height: 24)

    return view
  }()

  private lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
    st.axis = .vertical
    st.spacing = 8
    st.distribution = .fillEqually

    return st
  }()



  // MARK: - 라이프사이클
  // 뷰디드로드
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavbar()

  }

  // MARK: - 메서드
  // UI
  private func setupUI() {
    self.view.backgroundColor = UIColor.twitterBlue

    self.view.addSubview(logoImageView)
    logoImageView.centerX(inView: self.view, topAnchor: self.view.safeAreaLayoutGuide.topAnchor)
    logoImageView.setDimensions(width: 150, height: 150)

    self.view.addSubview(stack)
    stack.anchor(top: logoImageView.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor)

  }

  // 네비게이션바
  private func setupNavbar() {
    self.navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.isHidden = true

  }







}
