//
//  DropDownTableView.swift
//  ground
//
//  Created by TED on 2019/11/07.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

public protocol DropDownTableViewCellType {
    var seriesID: AnyHashable? { get set }
    var subSeriesID: AnyHashable? { get set }
}

// Internal table view

///
public protocol DropDownTableViewType {
    var seriesID: AnyHashable? { get set }
}

class DropDownTableView: UITableView, DropDownTableViewType {
    
    var seriesID: AnyHashable?

}
