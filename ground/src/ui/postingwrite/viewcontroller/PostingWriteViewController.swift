//
//  PostingWriteViewController.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class PostingWriteViewController: BaseViewController {

    @IBOutlet weak var viewDropDownTitle: UIView!
    @IBOutlet weak var tablePostingWrite: UITableView!
    
    var dropDownTitle: DropDownTitle!
    var dropDownView: DropDownView!
    
    var lounges: [String] = []
    
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
        
        // DropDownTitle
        dropDownTitle = DropDownTitle.instanceFromNib()
        dropDownTitle.delegate = self
        viewDropDownTitle.addSubview(dropDownTitle)
        
        // DropDownView
        dropDownView = DropDownView.instanceFromNib()
        dropDownView.delegate = self
    }
    
    private func initData() {
        // DropDownTitle
        dropDownTitle.setData(title: "Bulletin Board")
        
        // DropDownView
        lounges = ["Service Lounge", "IT Lounge", "Design Lounge", "Developer Lounge"]
        dropDownView.setData(data: lounges)
    }


}


extension PostingWriteViewController: TNavigationBarDelegate {
    func actionLeftButton() {
        pushBack()
    }
    
    func actionRightButton() {
        
    }
}


// MARK: DropDown
///----------------------------------------------------
/// DropDownTitleDelegate
///----------------------------------------------------
extension PostingWriteViewController: DropDownTitleDelegate {
    func actionDropDown(title: String, isOpen: Bool) {
        isOpen ? openDropDown() : closeDropDown()
    }
    
    func openDropDown() {
        dropDownView.show(parentView: self.view)
        dropDownTitle.openDropDown()
    }
    
    func closeDropDown() {
        dropDownView.hide()
        dropDownTitle.closeDropDown()
    }
}

extension PostingWriteViewController: DropDownViewDelegate {
    func actionSelectedItem(title: String?) {
        closeDropDown()
        dropDownTitle.setData(title: title!)
        self.view.makeToast("\(String(describing: title!)) 라운지 선택")
    }
    
    func actionBackground() {
        closeDropDown()
    }
}
