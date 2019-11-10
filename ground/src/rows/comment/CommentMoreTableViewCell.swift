//
//  CommentMoreTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/10.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_COMMENT_MORE = "CommentMoreTableViewCell"

protocol CommentMoreDelegate {
    func actionCommentMore()
}

class CommentMoreTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelMore: TLabel!
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: delegate
    var delegate: CommentMoreDelegate!
    
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
        labelMore.text = String.init(format: "이전 댓글 %d개 더 보기..", data.recomment.count)
    }

    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionCommentMore(_ sender: Any) {
        delegate?.actionCommentMore()
    }
    
}
