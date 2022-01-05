//
//  AppDelegate.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpInitView()
        return true
    }
    
    fileprivate func setUpInitView() {
        let nav = UINavigationController()
        nav.navigationBar.prefersLargeTitles = true
        initView(nav: nav)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    fileprivate func initView(nav: UINavigationController) {
        let welcomeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
        nav.pushViewController(welcomeView, animated: true)
    }
    
}

