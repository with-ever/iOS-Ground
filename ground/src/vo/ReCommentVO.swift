//
//  RecommentVO.swift
//  ground
//
//  Created by TED on 2019/11/10.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

public struct ReCommentVO: Codable {

    var comment: String = ""

    init(comment: String) {
        self.comment = comment
    }
    
}
