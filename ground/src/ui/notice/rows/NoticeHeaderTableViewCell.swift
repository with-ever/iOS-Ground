//
//  NoticeHeaderTableViewCell.swift
//  ground
//
//  Created by TED on 2019/10/23.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

protocol NoticeHeaderDelegate {
    func actionMyPosts()
    func actionOtherPosts()
}

class NoticeHeaderTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelMyPosts: UILabel!
    @IBOutlet weak var labelOtherPosts: UILabel!
    
    @IBOutlet weak var viewMyPosts: UIView!
    @IBOutlet weak var viewOtherPosts: UIView!
    
    // MARK: variable
    private var indexPath: IndexPath!
    private var tabNotice: NoticeTab! = .MyPosts
    
    // MARK: delegate
    var delegate: NoticeHeaderDelegate!
    
    ///----------------------------------------------------
    /// Initialize
    ///----------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        initLanguage()
        initLayout()
    }

    private func initLanguage() {
        labelTitle.text = "notice_title".localized
        labelSubTitle.text = "notice_sub_title".localized
        labelMyPosts.text = "notice_tab_my_post".localized
        labelOtherPosts.text = "notice_tab_other_posts".localized
    }
    
    private func initLayout() {
        changeTabLayout()
    }
    
    public func changeTab(tab: NoticeTab) {
        if tabNotice == tab { return }
        tabNotice = tab
        changeTabLayout()
    }
    
    ///----------------------------------------------------
    /// Layout
    ///----------------------------------------------------
    private func changeTabLayout() {
        if tabNotice == .MyPosts {
            viewMyPosts.backgroundColor = Color.getKeyColor()
            labelMyPosts.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            labelMyPosts.textColor = Color.white
            
            viewOtherPosts.backgroundColor = Color.white
            labelOtherPosts.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            labelOtherPosts.textColor = Color.black
        }
        else {
            viewOtherPosts.backgroundColor = Color.getKeyColor()
            labelOtherPosts.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            labelOtherPosts.textColor = Color.white
            
            viewMyPosts.backgroundColor = Color.white
            labelMyPosts.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            labelMyPosts.textColor = Color.black
        }
    }
    
    
    ///----------------------------------------------------
    /// Data
    ///----------------------------------------------------
    public func setData() {
        changeTab(tab: tabNotice)
    }

    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionMyPosts(_ sender: Any) {
        changeTab(tab: .MyPosts)
        delegate?.actionMyPosts()
    }
    
    @IBAction func actionOtherPosts(_ sender: Any) {
        changeTab(tab: .OtherPosts)
        delegate?.actionOtherPosts()
    }
    
}


enum NoticeTab {
    case MyPosts
    case OtherPosts
}
