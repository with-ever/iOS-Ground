//
//  DropDownTitle.swift
//  ground
//
//  Created by TED on 2019/11/07.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

protocol DropDownTitleDelegate {
    func actionDropDown(title: String, isOpen: Bool)
}

class DropDownTitle: UIView {

    @IBOutlet weak var labelTitle: UILabel!    
    @IBOutlet weak var imgArrow: UIImageView!
    
    var title: String = ""
    var delegate: DropDownTitleDelegate!
    
    var isOpen: Bool = false
    
    ///----------------------------------------------------
    /// Instance
    ///----------------------------------------------------
    public class func instanceFromNib() -> DropDownTitle {
        return UINib(nibName: "DropDownTitle", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DropDownTitle
    }
    
    ///----------------------------------------------------
    /// Initialize
    ///----------------------------------------------------
    public func setData(title: String) {
        self.title = title
        labelTitle.text = title
    }
    
    
    ///----------------------------------------------------
    /// Call Method
    ///----------------------------------------------------
    public func openDropDown() {
        isOpen = true
        changeLayout()
    }
    
    public func closeDropDown() {
        isOpen = false
        changeLayout()
    }
    
    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionDropDown(_ sender: Any) {
        delegate?.actionDropDown(title: title, isOpen: !isOpen)
    }

    ///----------------------------------------------------
    /// Layout
    ///----------------------------------------------------
    private func changeLayout() {
        if isOpen {
            imgArrow.backgroundColor = Color.blue
        } else {
            imgArrow.backgroundColor = Color.orange
        }
    }
    
}
