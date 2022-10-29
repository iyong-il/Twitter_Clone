//
//  ExploreViewController.swift
//  Twitter_Clone
//
//  Created by 이용일(Rodi) on 2022/10/29.
//

import UIKit

class ExploreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

  private func setupUI() {
    self.navigationItem.title = "Explore"
    self.view.backgroundColor = .white
  }

}
