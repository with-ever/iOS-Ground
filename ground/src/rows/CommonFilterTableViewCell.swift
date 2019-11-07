//
//  CommonFilterTableViewCell.swift
//  ground
//
//  Created by TED on 2019/10/25.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

protocol CommonFilterDelegate {
    func actionFilter()
}

let CELL_COMMON_FILTER = "CommonFilterTableViewCell"
class CommonFilterTableViewCell: BaseTableViewCell {

    // MARK: views
    
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: delegate
    var delegate: CommonFilterDelegate!
    
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
    public func setData() {

    }
    
    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionFilter(_ sender: Any) {
        delegate?.actionFilter()
    }
    
}
