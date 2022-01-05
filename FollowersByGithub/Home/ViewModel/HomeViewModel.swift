//
//  HomeViewModel.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import Foundation
import RxCocoa
import RxSwift
import RxDataSources
import UIKit

class HomeViewModel {
    
    fileprivate let disposeBag = DisposeBag()
    var followersArray = [Followers]()
    
    func setUpTitleView() -> String {
        return "Followers"
    }
    
    func setUpActions(viewcontroller: UIViewController, refreshButton: UIButton, searchButton: UIButton, searchTextField: UITextField, completion: @escaping([Followers]) -> ()) {
        searchButton.rx.tap
            .bind { [weak self] in
                guard let username = searchTextField.text else {return}
                let user = User(username: username)
                if username.isEmpty {
                    self?.setAlert(viewcontroller: viewcontroller)
                    return
                }
                self?.getFollowers(user: user, refreshButton: refreshButton, completion: completion)
            }.disposed(by: disposeBag)
        
        refreshButton.rx.tap
            .bind { [weak self] in
                guard let username = searchTextField.text else {return}
                let user = User(username: username)
                if username.isEmpty {
                    self?.setAlert(viewcontroller: viewcontroller)
                    return
                }
                self?.getFollowing(user: user, refreshButton: refreshButton, completion: completion)
            }.disposed(by: disposeBag)
    }
    
    fileprivate func setAlert(viewcontroller: UIViewController) {
        let alert = UIAlertController(title: "User Empty", message: "Complete to Search", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        viewcontroller.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func getFollowers(user: User, refreshButton: UIButton, completion: @escaping([Followers]) -> ()) {
        FollowersApi.shared.getFollowersByUser(user: user) { followers in
            completion(followers)
        }
    }
    
    fileprivate func getFollowing(user: User, refreshButton: UIButton, completion: @escaping([Followers]) -> ()) {
        FollowersApi.shared.getFollowingByUser(user: user) { followers in
            completion(followers)
        }
    }
}
