//
//  DropDownTableViewCell.swift
//  ground
//
//  Created by TED on 2019/11/08.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let CELL_DROP_DOWN = "DropDownTableViewCell"
let CELL_DROP_DOWN_HEIGHT = 50

protocol DropDownDelegate {
    func actionDropDown(indexPath: IndexPath, title: String?)
}

class DropDownTableViewCell: BaseTableViewCell {
    
    // MARK: views
    @IBOutlet weak var labelTitle: UILabel!
    
    // MARK: variable
    private var indexPath: IndexPath!
    
    // MARK: delegate
    var delegate: DropDownDelegate!
    
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
    public func setData(indexPath: IndexPath, title: String) {
        self.indexPath = indexPath
        labelTitle.text = title
    }
    
    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionDropDown(_ sender: Any) {
        delegate?.actionDropDown(indexPath: indexPath, title: labelTitle.text)
    }
    
}
