//
//  AlarmHeaderTableViewCell.swift
//  ground
//
//  Created by TED on 2019/10/23.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

protocol AlarmHeaderDelegate {
    func actionMyPosts()
    func actionOtherPosts()
}

class AlarmHeaderTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    @IBOutlet weak var labelMyPosts: UILabel!
    @IBOutlet weak var labelOtherPosts: UILabel!
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: delegate
    var delegate: AlarmHeaderDelegate!
    
    ///----------------------------------------------------
    /// Initialize
    ///----------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        initLanguage()
        initLayout()
    }

    private func initLanguage() {
        labelTitle.text = "alarm_title".localized
        labelSubTitle.text = "alarm_sub_title".localized
        labelMyPosts.text = "alarm_tab_my_post".localized
        labelOtherPosts.text = "alarm_tab_other_posts".localized
    }
    
    private func initLayout() {
        
    }
    
    
    ///----------------------------------------------------
    /// Data
    ///----------------------------------------------------
    public func setData() {

    }

    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionMyPosts(_ sender: Any) {
        delegate?.actionMyPosts()
    }
    
    @IBAction func actionOtherPosts(_ sender: Any) {
        delegate?.actionOtherPosts()
    }
    
}
