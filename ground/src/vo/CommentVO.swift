//
//  CommentVO.swift
//  ground
//
//  Created by TED on 2019/11/10.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

public struct CommentVO: Codable {
    
    var comment: String = ""
    var recomment: [ReCommentVO] = []
    
    init(comment: String, recomment: [ReCommentVO]) {
        self.comment = comment
        self.recomment = recomment
    }
    
}
