//
//  PostingTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/07.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_POSTING_TEXT = "PostingTextTableViewCell"

protocol PostingTextDelegate {
    func actionPostingDetail(indexPath: IndexPath)
    func actionLike(indexPath: IndexPath)
    func actionComment(indexPath: IndexPath)
    func actionShare(indexPath: IndexPath)
    func actionBookmark(indexPath: IndexPath)
}

class PostingTextTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var labelPostingTitle: UILabel!
    @IBOutlet weak var labelPostingDetail: UILabel!
    
    @IBOutlet weak var labelCompanyName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    
    @IBOutlet weak var labelViewCount: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelLikeCount: UILabel!
    @IBOutlet weak var labelCommentCount: UILabel!
    @IBOutlet weak var labelShareCount: UILabel!
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: delegate
    var delegate: PostingTextDelegate!
    
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
        self.indexPath = indexPath
        
        labelPostingTitle.text = "스타트업 이직"
        labelPostingDetail.text = "아는 지인이 스타트업으로 오퍼가 왔다는데, 처음 가는거라 연봉때문에 갈지말지 고민이라고 하더라구요. 아는 지인이 스타트업으로 오퍼가 왔다는데, 처음 가는거라 연봉때문에 갈지말지 고민이라고 하더라구요"
        
        labelCompanyName.text = "회사명"
        labelUserName.text = "닉네임"
        
        labelViewCount.text = "1126"
        labelTime.text = "6시간"
        
        labelLikeCount.text = "205"
        labelCommentCount.text = "550"
        labelShareCount.text = "220"
    }
    
    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionPostingDetail(_ sender: Any) {
        delegate?.actionPostingDetail(indexPath: indexPath)
    }
    
    @IBAction func actionLike(_ sender: Any) {
        delegate?.actionLike(indexPath: indexPath)
    }
    
    @IBAction func actionComment(_ sender: Any) {
        delegate?.actionComment(indexPath: indexPath)
    }
    
    @IBAction func actionShare(_ sender: Any) {
        delegate?.actionShare(indexPath: indexPath)
    }
    
    @IBAction func actionBookmark(_ sender: Any) {
        delegate?.actionBookmark(indexPath: indexPath)
    }
}
