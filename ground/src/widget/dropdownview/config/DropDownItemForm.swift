//
//  DropDownItemForm.swift
//
//  Created by TED on 2019/11/07.
//  Copyright © 2019 WithEver. All rights reserved.
//

import Foundation

public protocol DropDownItemForm {
    /// Menu item's series identifier, it's non-null
    var seriesIdentifier: String { get }
    /// Menu item's subseries identifier, it's an optional value.
    var subseriesIdentifier: String? { get }
}
