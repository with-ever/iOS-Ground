//
//  PostingVO.swift
//  ground
//
//  Created by TED on 2019/11/09.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

public struct PostingDetailVO: Codable {
    var type: PostingType
    var textContents: String? = ""
    var imgURL: String? = ""
    
    init(type: PostingType, textContents: String, imgURL: String) {
        self.type = type
        self.textContents = textContents
        self.imgURL = imgURL
    }
}

public enum PostingType: Int, Codable {
    case TEXT = 0
    case IMAGE = 1
}
