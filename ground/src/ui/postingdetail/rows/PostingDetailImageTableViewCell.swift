//
//  PostingDetailImageTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_POSTING_DETAIL_IMAGE = "PostingDetailImageTableViewCell"

class PostingDetailImageTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var imgContents: TImageView!
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: constraint
    @IBOutlet weak var constraintImageHeight: NSLayoutConstraint!
    
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
        imgContents.load(url: data.imgURL)
    }
}
