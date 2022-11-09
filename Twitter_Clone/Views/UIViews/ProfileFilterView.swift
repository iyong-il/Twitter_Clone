//
//  ProfileFilterView.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/11/08.
//

import UIKit

private let reuseIdentifier = "ProfileFilterCell"

protocol ProfileFilterViewDelegate: AnyObject {
  func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath)
}

final class ProfileFilterView: UIView {

  weak var delegate: ProfileFilterViewDelegate?

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self

    let seletedIndexPath = IndexPath(row: 0, section: 0)
    collectionView.selectItem(at: seletedIndexPath, animated: true, scrollPosition: .left)



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

    return ProfileFilterOptions.allCases.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileFilterCell

    
    let option = ProfileFilterOptions(rawValue: indexPath.row)
    cell.option = option
    

    return cell
  }



}

extension ProfileFilterView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.filterView(self, didSelect: indexPath)
  }
}

extension ProfileFilterView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let count = CGFloat(ProfileFilterOptions.allCases.count)
    let size = CGSize(width: self.frame.width / count, height: self.frame.height)
    
    return size
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

}

//extension ProfileFilterView: ProfileFilterViewDelegate {
//  func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
//
//  }
//
//
//}
