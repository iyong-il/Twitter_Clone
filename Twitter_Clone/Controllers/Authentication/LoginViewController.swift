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
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }

    AuthService.shared.logUserIn(email: email, password: password) { (result, error) in
      if let error = error {
        print(#fileID, #function, #line, "- 아이디및 비밀번호가 일치하지 않습니다.: \(error.localizedDescription)")
        return
      }

      print(#fileID, #function, #line, "- 로그인 성공")
      
      guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow}),
            let tab = window.rootViewController as? MainTabBarController else { return }

      tab.authenticationUserAndSetupUI()

      self.dismiss(animated: true)
    }
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }

  // 하단버튼
  @objc func handleShowSignUp() {
    let vc = RegistrationViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }




}
