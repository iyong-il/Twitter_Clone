//
//  ProfileFilterView.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/08.
//

import UIKit

private let reuseIdentifier = "ProfileFilterCell"

final class ProfileFilterView: UIView {

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.register(ProfileFilterCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    return collectionView
  }()



  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(collectionView)
    collectionView.addConstraintsToFillView(self)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }




}

extension ProfileFilterView: UICollectionViewDataSource {


  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return 3
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileFilterCell

    return cell
  }



}

extension ProfileFilterView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = CGSize(width: self.frame.width / 3, height: self.frame.height)
    
    return size
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

}
