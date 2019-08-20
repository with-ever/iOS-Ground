//
//  ClipBoardUtils.swift
//  ground
//
//  Created by TED on 19/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class ClipBoardUtils {

    func getClipBoardText() -> String? {
        return UIPasteboard.general.string
    }
    
    func setClipBoardText(_ saveString: String) {
        UIPasteboard.general.string = saveString
    }
    
}
