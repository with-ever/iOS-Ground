//
//  DropDownView.swift
//  ground
//
//  Created by TED on 2019/11/07.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

protocol DropDownViewDelegate {
    func actionSelectedItem(title: String?)
    func actionBackground()
}

public class DropDownView: UIView {
    
    @IBOutlet weak var tableDropDown: UITableView!
    
    @IBOutlet weak var constraintTableTopMargin: NSLayoutConstraint!
    @IBOutlet weak var constraintTableHeight: NSLayoutConstraint!
    
    var parentView: UIView?
    var listDropDownList: [String] = []
    
    var delegate: DropDownViewDelegate!
    
    ///----------------------------------------------------
    /// Instance
    ///----------------------------------------------------
    public class func instanceFromNib() -> DropDownView {
        return UINib(nibName: "DropDownView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DropDownView
    }
    
    public func initLayout() {
        // TableView - delegate
        tableDropDown.delegate = self
        tableDropDown.dataSource = self
        tableDropDown.estimatedRowHeight = UITableView.automaticDimension
        tableDropDown.rowHeight = UITableView.automaticDimension
        
        // TableView - register
        tableDropDown.register(UINib.init(nibName: CELL_DROP_DOWN, bundle: nil), forCellReuseIdentifier: CELL_DROP_DOWN)
    }
    
    public func setData(data: [String]) {
        initLayout()
        listDropDownList = data
        tableDropDown.reloadData()
        constraintTableHeight.constant = CGFloat(listDropDownList.count * CELL_DROP_DOWN_HEIGHT) + 2
    }
    
    ///----------------------------------------------------
    /// Call method
    ///----------------------------------------------------
    public func show(parentView: UIView?) {
        if self.parentView == nil {
            self.parentView = parentView
            self.parentView?.window?.addSubview(self)
            tableDropDown.reloadData()
        }
    }

    public func hide() {
        if parentView != nil {
            self.removeFromSuperview()
            parentView = nil
        }
    }
    
    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionBackground(_ sender: Any) {
        delegate?.actionBackground()
    }
    
}


///----------------------------------------------------
/// TableView - DropDownDelegate
///----------------------------------------------------
extension DropDownView: DropDownDelegate {
    func actionDropDown(indexPath: IndexPath, title: String?) {
        delegate?.actionSelectedItem(title: title)
    }
}

///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension DropDownView: UITableViewDataSource {
    
    /**
     * table row 갯수
     */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDropDownList.count
    }
    
    /**
     * 각 row 마다 데이터 세팅.
     */
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row as Int
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_DROP_DOWN, for: indexPath) as! DropDownTableViewCell
        cell.delegate = self
        cell.setData(indexPath: indexPath, title: listDropDownList[index])
        return cell
    }
}


///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension DropDownView: UITableViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
