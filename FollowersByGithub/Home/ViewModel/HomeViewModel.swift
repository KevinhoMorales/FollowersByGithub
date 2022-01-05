//
//  HomeViewModel.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

class HomeViewModel {
    
    fileprivate let disposeBag = DisposeBag()
    var followersArray = [Followers]()
    
    func setUpTitleView() -> String {
        return "Followers"
    }
    
    func setUpActions(viewcontroller: UIViewController, refreshButton: UIButton, searchButton: UIButton, searchTextField: UITextField, followersTableView: UITableView) {
        searchButton.rx.tap
            .bind { [weak self] in
                guard let username = searchTextField.text else {return}
                let user = User(username: username)
                if username.isEmpty {
                    self?.setAlert(viewcontroller: viewcontroller)
                    return
                }
                
            }.disposed(by: disposeBag)
    }
    
    fileprivate func setAlert(viewcontroller: UIViewController) {
        print("User Empty!")
    }
    
    fileprivate setDataSource(followersTableView: UITableView) {
        let dataSource = Reloa
    }
    
    fileprivate func getFollowers(user: User, refreshButton: UIButton, completion: @escaping([Followers]) -> ()) {
        FollowersApi.shared.getFollowersByUser(user: user) { followers in
            completion(followers)
            refreshButton.isHidden = false
        }
    }
}
