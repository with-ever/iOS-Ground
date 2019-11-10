//
//  PostingDetailTextTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_POSTING_DETAIL_TEXT = "PostingDetailTextTableViewCell"

class PostingDetailTextTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelContents: TLabel!
    
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
    public func setData(indexPath: IndexPath, data: PostingDetailVO) {
        labelContents.text = data.textContents
    }
}
