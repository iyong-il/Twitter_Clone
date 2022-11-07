//
//  ProfileFilterCell.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/08.
//

import UIKit

final class ProfileFilterCell: UICollectionViewCell {

  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = .systemFont(ofSize: 14)
    label.text = "Test Filter"

    return label
  }()

  override var isSelected: Bool {
    didSet {
      titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16) :
                                      UIFont.systemFont(ofSize: 14)
      titleLabel.textColor = isSelected ? .twitterBlue : .lightGray
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white

    self.addSubview(titleLabel)
    titleLabel.center(inView: self)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }





}
