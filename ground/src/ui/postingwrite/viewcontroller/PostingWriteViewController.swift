//
//  PostingWriteViewController.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class PostingWriteViewController: BaseViewController {

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
        setWriteNavigationBar(delegate: self)
        useSwipeBackScreen()
    }
    
    private func initData() {
        
    }


}


extension PostingWriteViewController: TNavigationBarDelegate {
    func actionLeftButton() {
        pushBack()
    }
    
    func actionRightButton() {
        
    }
}
