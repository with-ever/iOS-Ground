//
//  CommentTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_COMMENT = "CommentTableViewCell"

class CommentTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelCompanyName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelCommentDetail: UILabel!
    @IBOutlet weak var labelLike: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
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
    public func setData(indexPath: IndexPath, data: CommentVO) {
        labelCompanyName.text = "회사명"
        labelUserName.text = "닉네임"
        labelCommentDetail.text = data.comment
        
        labelLike.text = "좋아요 505개"
        labelComment.text = "댓글"
        labelTime.text = "3시간"
    }
        
}
