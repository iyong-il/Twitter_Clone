//
//  Custom.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/28.
//

import UIKit

struct Utilities {

  func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
    let view = UIView()
    let iv = UIImageView()
    let dividerView = UIView()

    view.addSubview(iv)
    view.addSubview(textField)
    view.addSubview(dividerView)

    view.anchor(height: 50)

    iv.image = image
    iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
    iv.setDimensions(width: 24, height: 24)

    textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)

    dividerView.backgroundColor = .white
    dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight: 8, height: 0.75)

    return view
  }

  func textField(withPlaceholder placeholder: String) -> UITextField {
    let tf = UITextField()
    tf.textColor = .white
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    return tf
  }

  func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
    attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))

    button.setAttributedTitle(attributedTitle, for: .normal)

    return button
  }
  
}
