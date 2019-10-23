//
//  NoticeTableViewCell.swift
//  ground
//
//  Created by TED on 2019/10/23.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class NoticeTableViewCell: BaseTableViewCell {

    // MARK: views
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCompanyName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelContents: UILabel!
    
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
        viewCard.drawRoundBorder(color: Color.clear, borderWidth: 0.0, radius: 7)
        viewCard.shadow(color: Color.lightGray, radius: 7, opacity: 0.15, offset: CGSize.init(width: 1, height: 1))
    }
    
    
    ///----------------------------------------------------
    /// Data
    ///----------------------------------------------------
    public func setData() {
        labelTitle.text = "스타트업 이직"
        labelCompanyName.text = "회사명"
        labelUserName.text = "닉네임"
        labelContents.text = "아는 지인이 스타트업에서 오퍼가 왔다는데, 처음 가는거라 연봉 때문에 갈지 말지 고민이예요 어떻게 해야할까요"
    }

}
