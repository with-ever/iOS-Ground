//
//  LaunchScreenViewController.swift
//  ground
//
//  Created by TED on 19/09/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class LaunchScreenViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NavigationUtils.rootView(storyBoard: "Main", viewControllerName: "MainNavigationController")
    }

}
