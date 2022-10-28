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

  private lazy var emailContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
    let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)

    return view
  }()

  private lazy var passwordContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
    let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)

    return view
  }()

  private let emailTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Email")
    tf.autocapitalizationType = .none

    return tf
  }()

  private let passwordTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Password")
    tf.isSecureTextEntry = true

    return tf
  }()

  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.setTitleColor(.twitterBlue, for: .normal)
    button.backgroundColor = .white
    // 스택뷰가 fillequaliy라서 주석처리
    // button.anchor(height: 50)
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

    return button
  }()

  private lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
    st.axis = .vertical
    st.spacing = 20
    st.distribution = .fillEqually

    return st
  }()

  private let dontHaveAccountButton: UIButton = {
    let button = Utilities().attributedButton("Don't have an account?", " Sign Up")
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)

    return button
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
    stack.anchor(top: logoImageView.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingLeft: 32, paddingRight: 32)

    self.view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.anchor(left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingLeft: 40, paddingRight: 40)

  }

  // 네비게이션바
  private func setupNavbar() {
    self.navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.isHidden = true

  }


  // MARK: - 셀렉터
  // 로그인버튼
  @objc func handleLogin() {

  }

  // 하단버튼
  @objc func handleShowSignUp() {
    let vc = RegistrationViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }




}
