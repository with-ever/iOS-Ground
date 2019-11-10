//
//  PostingDetailInfoTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_POSTING_DETAIL_INFO = "PostingDetailInfoTableViewCell"

class PostingDetailInfoTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelViewCount: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var labelLikeCount: UILabel!
    @IBOutlet weak var labelCommentCount: UILabel!
    @IBOutlet weak var labelShareCount: UILabel!
    
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
        labelViewCount.text = "1125"
        labelTime.text = "6시간"
        
        labelLikeCount.text = "205"
        labelCommentCount.text = "505"
        labelShareCount.text = "20"
    }
}
