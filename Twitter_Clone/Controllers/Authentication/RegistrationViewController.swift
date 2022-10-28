//
//  RegistrationViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit

final class RegistrationViewController: UIViewController {

  // MARK: - 속성
  // 이미지피커
  private let imagePicker = UIImagePickerController()

  private lazy var plusPhotoButton: UIButton = {
    let button = UIButton(type:  .system)
    button.setImage(UIImage(named: "plus_photo"), for: .normal)
    button.tintColor = .white
    button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
    return button
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

  private lazy var fullNameContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
    let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)

    return view
  }()

  private lazy var userNameContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
    let view = Utilities().inputContainerView(withImage: image, textField: userNameTextField)

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

  private let fullNameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Full Name")
    tf.autocapitalizationType = .none

    return tf
  }()

  private let userNameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Username")
    tf.isSecureTextEntry = true

    return tf
  }()

  private let registrationButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.setTitleColor(.twitterBlue, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)

    return button
  }()

  private lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullNameContainerView, userNameContainerView, registrationButton])
    st.axis = .vertical
    st.spacing = 20
    st.distribution = .fillEqually

    return st
  }()

  private let alreadyHaveAccountButton: UIButton = {
    let button = Utilities().attributedButton("Already have an account?", " Log In")
    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)

    return button
  }()

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

    self.view.addSubview(plusPhotoButton)
    plusPhotoButton.centerX(inView: self.view, topAnchor: self.view.safeAreaLayoutGuide.topAnchor)
    plusPhotoButton.setDimensions(width: 128, height: 128)

    self.view.addSubview(stack)
    stack.anchor(top: plusPhotoButton.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

    self.view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.anchor(left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingLeft: 40, paddingRight: 40)

    imagePicker.delegate = self
    imagePicker.allowsEditing = true
  }

  // MARK: - 셀렉터
  // 이미지피커 눌렀을 때
  @objc func handleAddProfilePhoto() {
    present(imagePicker, animated: true)
  }

  // 회원가입 버튼
  @objc func handleRegistration() {

  }

  // 하단버튼
  @objc func handleShowLogin() {
    self.navigationController?.popViewController(animated: true)
  }

}
// MARK: - 확장 / 이미지피커 델리게이트
extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let profileImage = info[.editedImage] as? UIImage else { return }

    plusPhotoButton.layer.cornerRadius = 128 / 2
    plusPhotoButton.layer.borderColor = UIColor.white.cgColor
    plusPhotoButton.layer.borderWidth = 3
    plusPhotoButton.layer.masksToBounds = true
    plusPhotoButton.imageView?.contentMode = .scaleAspectFill
    plusPhotoButton.imageView?.clipsToBounds = true

    self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)

    dismiss(animated: true)
  }

}
