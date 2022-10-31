//
//  CaptionTextView.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/31.
//

import UIKit

class CaptionTextView: UITextView {

  // MARK: - 속성
  // 플레이스홀더 레이블
  let placeholderLabel: UILabel = {
    let label = UILabel()
    label.text = "What's happening?"
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .darkGray

    return label
  }()

  // MARK: - 라이프 사이클
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  fileprivate func setup() {
    self.backgroundColor = .red
    self.font = UIFont.systemFont(ofSize: 16)
    self.isScrollEnabled = true
    self.anchor(height: 300)
    
    self.addSubview(placeholderLabel)
    placeholderLabel.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 8, paddingLeft: 4)

    NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
  }

  @objc func handleTextInputChange() {
    placeholderLabel.isHidden = !text.isEmpty
//    if self.text != "" {
//      placeholderLabel.text = ""
//    } else {
//      placeholderLabel.text = "What's happening?"
//    }
  }
}
