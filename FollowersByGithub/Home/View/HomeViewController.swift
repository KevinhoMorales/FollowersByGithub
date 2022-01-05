//
//  HomeViewController.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import UIKit

class HomeViewController: UIViewController {

    fileprivate let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpView() {
        title = viewModel.setUpTitleView()
    }

}
