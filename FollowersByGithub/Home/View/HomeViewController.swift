//
//  HomeViewController.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var followersTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var backgroundStackView: UIStackView!
    @IBOutlet weak var refreshButton: UIButton!
    
    fileprivate let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpView() {
        title = viewModel.setUpTitleView()
        viewModel.setUpActions(viewcontroller: self, refreshButton: refreshButton, searchButton: searchButton, searchTextField: searchTextField) { [weak self] followers in
            DispatchQueue.main.async {
                self?.viewModel.followersArray = followers
                self?.backgroundStackView.isHidden = true
                self?.followersTableView.isHidden = false
                self?.followersTableView.reloadData()
            }
        }
        setUpCell()
    }
    
    fileprivate func setUpCell() {
        let cell = UINib(nibName: "FollowersTableViewCell", bundle: nil)
        followersTableView.register(cell, forCellReuseIdentifier: FollowersTableViewCell.CELL_ID)
        followersTableView.tableFooterView = UIView()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.followersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FollowersTableViewCell.CELL_ID, for: indexPath) as! FollowersTableViewCell
        let follower = viewModel.followersArray[indexPath.row]
        cell.setUpCell(follower: follower)
        return cell
    }
}
