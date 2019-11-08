//
//  MainTabBarViewController.swift
//  ground
//
//  Created by TED on 19/09/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    var arrayTab: NSArray!
    var mainHomeViewController: MainHomeViewController!
    var mainSearchViewController: MainSearchViewController!
    var mainWriteViewController: MainWriteViewController!
    var mainBookmarkViewController: MainBookmarkViewController!
    var mainMyViewController: MainMyViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        initLayout()
    }
    
    private func initLayout() {
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = Color.getKeyColor()

        if mainHomeViewController == nil {
            mainHomeViewController = UIStoryboard.init(name: "MainHome", bundle: nil).instantiateViewController(withIdentifier: "MainHomeViewController") as? MainHomeViewController
        }
        if mainSearchViewController == nil {
            mainSearchViewController = UIStoryboard.init(name: "MainSearch", bundle: nil).instantiateViewController(withIdentifier: "MainSearchViewController") as? MainSearchViewController
        }
        if mainWriteViewController == nil {
            mainWriteViewController = UIStoryboard.init(name: "MainWrite", bundle: nil).instantiateViewController(withIdentifier: "MainWriteViewController") as? MainWriteViewController
        }
        if mainBookmarkViewController == nil {
            mainBookmarkViewController = UIStoryboard.init(name: "MainBookmark", bundle: nil).instantiateViewController(withIdentifier: "MainBookmarkViewController") as? MainBookmarkViewController
        }
        if mainMyViewController == nil {
            mainMyViewController = UIStoryboard.init(name: "MainMy", bundle: nil).instantiateViewController(withIdentifier: "MainMyViewController") as? MainMyViewController
        }
        
        if arrayTab == nil {
            arrayTab = NSArray.init(array: [mainHomeViewController ?? MainHomeViewController(),
                                            mainSearchViewController ?? MainSearchViewController(),
                                            mainWriteViewController ?? MainWriteViewController(),
                                            mainBookmarkViewController ?? MainBookmarkViewController(),
                                            mainMyViewController ?? MainMyViewController()])
            
            let tabMainHome = mainHomeViewController.tabBarItem
            tabMainHome?.image = UIImage.init(named: "ic_tab_home_unselected")
            tabMainHome?.selectedImage = UIImage.init(named: "ic_tab_home_selected")
            tabMainHome?.title = "Home"
            
            let tabMainSearch = mainSearchViewController.tabBarItem
            tabMainSearch?.image = UIImage.init(named: "ic_tab_search_unselected")
            tabMainSearch?.selectedImage = UIImage.init(named: "ic_tab_search_selected")
            tabMainSearch?.title = "Search"
            
            let tabMainWrite = mainWriteViewController.tabBarItem
            tabMainWrite?.image = UIImage.init(named: "ic_tab_write_unselected")
            tabMainWrite?.selectedImage = UIImage.init(named: "ic_tab_write_selected")
            tabMainWrite?.title = "Write"
            
            let tabMainBookmark = mainBookmarkViewController.tabBarItem
            tabMainBookmark?.image = UIImage.init(named: "ic_tab_bookmark_unselected")
            tabMainBookmark?.selectedImage = UIImage.init(named: "ic_tab_bookmark_selected")
            tabMainBookmark?.title = "Bookmark"
            
            let tabMainMy = mainMyViewController.tabBarItem
            tabMainMy?.image = UIImage.init(named: "ic_tab_my_unselected")
            tabMainMy?.selectedImage = UIImage.init(named: "ic_tab_my_selected")
            tabMainMy?.title = "My page"
        }
        
        setViewControllers(arrayTab as? [UIViewController], animated: false)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        if selectedIndex == 2 {
            NavigationUtils.pushView(navigationController: self.navigationController,
                                     storyBoard: "PostingWrite",
                                     viewControllerName: "PostingWriteViewController",
                                     isAnimation: true)
            return false
        } else {
            return true
        }
    }
    
}
