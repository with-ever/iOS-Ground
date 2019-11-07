//
//  PostingDetailViewController.swift
//  ground
//
//  Created by TED on 2019/10/25.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class PostingDetailViewController: BaseViewController {

    ///----------------------------------------------------
    /// Life cycle
    ///----------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initLanguage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    ///----------------------------------------------------
    /// Initialization
    ///----------------------------------------------------
    private func initLanguage() {
        
    }
    
    private func initLayout() {
        // Navigation Bar
//        setBackNavigationBar(delegate: <#T##TNavigationBarDelegate#>)
        useSwipeBackScreen()
    }
    
    private func initData() {
        
    }
    

}
