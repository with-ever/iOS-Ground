//
//  PostingDetailTitleTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_POSTING_DETAIL_TITLE = "PostingDetailTitleTableViewCell"

class PostingDetailTitleTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCompanyName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: delegate
    
    
    ///----------------------------------------------------
    /// Initialize
    ///----------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        initLanguage()
        initLayout()
    }

    private func initLanguage() {
        
    }
    
    private func initLayout() {
        
    }
    
    
    ///----------------------------------------------------
    /// Data
    ///----------------------------------------------------
    public func setData(indexPath: IndexPath) {
        labelTitle.text = "타이틀"
        labelCompanyName.text = "회사 이름"
        labelUserName.text = "사용자 이름"
    }
}
