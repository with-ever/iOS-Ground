//
//  BaseViewController.swift
//  ground
//
//  Created by TED on 18/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


///----------------------------------------------------
/// Navigation Bar
///----------------------------------------------------
extension BaseViewController {
    
    public func setMainNavigationBar(delegate: TNavigationBarDelegate) {
        let navigationBar = TNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: SystemUtils.screenWidth, height: NAVIGATION_BAR_HEIGHT + SystemUtils.statusBarHeight))
        navigationBar.style = .Main
        navigationBar.delegate = delegate
        navigationBar.initNavigationBar()
        view.addSubview(navigationBar)
    }
    
    public func setBackNavigationBar(delegate: TNavigationBarDelegate) {
        let navigationBar = TNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: SystemUtils.screenWidth, height: NAVIGATION_BAR_HEIGHT + SystemUtils.statusBarHeight))
        navigationBar.style = .Back
        navigationBar.delegate = delegate
        navigationBar.initNavigationBar()
        view.addSubview(navigationBar)
    }
    
    public func setWriteNavigationBar(delegate: TNavigationBarDelegate) {
        let navigationBar = TNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: SystemUtils.screenWidth, height: NAVIGATION_BAR_HEIGHT + SystemUtils.statusBarHeight))
        navigationBar.style = .Write
        navigationBar.delegate = delegate
        navigationBar.initNavigationBar()
        view.addSubview(navigationBar)
    }
    
}
