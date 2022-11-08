//
//  ProfileHeader.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/05.
//

import UIKit

final class ProfileHeader: UICollectionReusableView {


  private lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .twitterBlue

    view.addSubview(backButton)
    backButton.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 42, paddingLeft: 16)
    backButton.setDimensions(width: 30, height: 30)

    return view
  }()

  private lazy var backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "baseline_arrow_back_white_24dp")?.withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)

    return button
  }()

  private lazy var profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.backgroundColor = .black
    iv.layer.borderWidth = 4
    iv.layer.borderColor = UIColor.white.cgColor

    return iv
  }()

  private lazy var editProfileFollowButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Loading", for: .normal)
    button.setTitleColor(.twitterBlue, for: .normal)
    button.titleLabel?.font = .boldSystemFont(ofSize: 14)
    button.layer.borderWidth = 1.25
    button.layer.borderColor = UIColor.twitterBlue.cgColor
    button.addTarget(self, action: #selector(handleEditProfileFollow), for: .touchUpInside)

    return button
  }()

  private let fullnameLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20)
    label.text = "fullname"

    return label
  }()

  private let usernameLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    label.textColor = .lightGray
    label.text = "username"

    return label
  }()

  private let bioLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    label.numberOfLines = 3
    label.text = "This is a user bio that will span more than one line for test purpose"

    return label
  }()

  private lazy var userDetailStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel, bioLabel])
    st.axis = .vertical
    st.distribution = .fillProportionally
    st.spacing = 4

    return st
  }()
  
  private let filterBar = ProfileFilterView()

  private let underLineView: UIView = {
    let view = UIView()
    view.backgroundColor = .twitterBlue

    return view
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)

    filterBar.delegate = self

    self.addSubview(containerView)
    containerView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, height: 108)

    self.addSubview(profileImageView)
    profileImageView.anchor(top: containerView.bottomAnchor, left: self.leftAnchor, paddingTop: -24, paddingLeft: 8)
    profileImageView.setDimensions(width: 80, height: 80)
    profileImageView.layer.cornerRadius = 80 / 2

    self.addSubview(editProfileFollowButton)
    editProfileFollowButton.anchor(top: containerView.bottomAnchor, right: self.rightAnchor, paddingTop: 12, paddingRight: 12)
    editProfileFollowButton.setDimensions(width: 100, height: 36)
    editProfileFollowButton.layer.cornerRadius = 36 / 2

    self.addSubview(userDetailStack)
    userDetailStack.anchor(top: profileImageView.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)

    self.addSubview(filterBar)
    filterBar.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, height: 50)

    self.addSubview(underLineView)
    underLineView.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, width: frame.width / 3, height: 2)


  }





  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }



  @objc func handleDismissal() {

  }

  @objc func handleEditProfileFollow() {

  }


}

extension ProfileHeader: ProfileFilterViewDelegate {
  func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
    let cell = view.collectionView.cellForItem(at: indexPath) as! ProfileFilterCell

    let xPosition = cell.frame.origin.x
    UIView.animate(withDuration: 0.3) {
      self.underLineView.frame.origin.x = xPosition
    }
  }

  
}
