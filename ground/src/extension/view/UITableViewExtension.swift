//
//  UITableViewExtension.swift
//  ground
//
//  Created by TED on 27/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension UITableView {

    public func scrollTop() {
        scrollToPosition(row: 0, section: 0, isAnimated: true)
    }
    
    public func scrollToPosition(row: Int = 0, section: Int = 0, isAnimated: Bool = true) {
        scrollToRow(at: IndexPath.init(row: row, section: section), at: .top, animated: isAnimated)
    }
    
    public func updateCell() {
        self.beginUpdates()
        self.endUpdates()
    }
    
    public func updateCell(completion block: (() -> Swift.Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(block)
        
        let offset = self.contentOffset

//        UIView.performWithoutAnimation {
        self.beginUpdates()
        self.endUpdates()
//        }

        self.layer.removeAllAnimations()
        self.setContentOffset(offset, animated: false)
        CATransaction.commit()
    }
    
    public func reloadTableData() {
        self.reloadData()
    }
}
