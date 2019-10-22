//
//  AlarmViewController.swift
//  ground
//
//  Created by TED on 2019/10/22.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class AlarmViewController: BaseViewController {

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
        setBackNavigationBar(delegate: self)
    }
    
    private func initData() {
        
    }
    
}

///----------------------------------------------------
/// TNavigationBarDelegate
///----------------------------------------------------
extension AlarmViewController: TNavigationBarDelegate {
    func actionLeftButton() {
        pushBack()
    }
}
