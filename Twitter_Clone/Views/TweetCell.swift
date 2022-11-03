//
//  TweetCell.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/03.
//

import UIKit

final class TweetCell: UICollectionViewCell {

  // MARK: - 속성
  // 프로필 이미지
  private lazy var profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .twitterBlue
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.setDimensions(width: 48, height: 48)
    iv.layer.cornerRadius = 48 / 2
    iv.layer.masksToBounds = true

    return iv
  }()

  private let infoLabel: UILabel = {
    let label = UILabel()
    label.text = "good @ddd"
    label.font = UIFont.systemFont(ofSize: 14)


    return label
  }()

  private let captionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.numberOfLines = 0
    label.text = "some text..."

    return label
  }()

  private lazy var commentButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "comment"), for: .normal)
    button.tintColor = .darkGray
    button.setDimensions(width: 20, height: 20)
    button.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)

    return button
  }()

  private lazy var retweetButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "retweet"), for: .normal)
    button.tintColor = .darkGray
    button.setDimensions(width: 20, height: 20)
    button.addTarget(self, action: #selector(handleRetweetTapped), for: .touchUpInside)

    return button
  }()

  private lazy var likeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "like"), for: .normal)
    button.tintColor = .darkGray
    button.setDimensions(width: 20, height: 20)
    button.addTarget(self, action: #selector(handleLikeTapped), for: .touchUpInside)

    return button
  }()

  private lazy var shareButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "share"), for: .normal)
    button.tintColor = .darkGray
    button.setDimensions(width: 20, height: 20)
    button.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)

    return button
  }()

  private lazy var actionStack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, shareButton])
    st.axis = .horizontal
    st.spacing = 72



    return st
  }()

  let underLineView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGroupedBackground

    return view
  }()

  lazy var stack: UIStackView = {
    let st = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
    st.axis = .vertical
    st.distribution = .fillProportionally
    st.spacing = 4

    return st
  }()


  // MARK: - 라이프사이클
  override func updateConstraints() {
    setupAutoLayout()
    super.updateConstraints()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()

  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }


  // MARK: - 메서드
  // UI셋업
  fileprivate func setupUI() {
    self.backgroundColor = .white

    self.addSubview(profileImageView)
    self.addSubview(stack)
    self.addSubview(underLineView)
    self.addSubview(actionStack)

  }

  fileprivate func setupAutoLayout() {
    profileImageView.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 8, paddingLeft: 8)
    stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: self.rightAnchor, paddingLeft: 12, paddingRight: 12)
    underLineView.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, height: 1)
    actionStack.centerX(inView: self)
    actionStack.anchor(bottom: self.bottomAnchor, paddingBottom: 8)
  }


  @objc func handleCommentTapped() {

  }

  @objc func handleRetweetTapped() {

  }

  @objc func handleLikeTapped() {

  }

  @objc func handleShareTapped() {

  }

}
