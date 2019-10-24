//
//  GroundImage.swift
//  ground
//
//  Created by TED on 2019/10/24.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class GroundImage {
    
    static let shared = GroundImage()
 
    func icNotice(status: ImageState) -> UIImage {
        switch status {
        case .on: return UIImage.init(named: "ic_alarm_on")!
        case .off: return UIImage.init(named: "ic_alarm_off")!
        default: return UIImage.init(named: "ic_alarm_off")!
        }
    }
    
}

enum ImageState {
    case selected
    case unselected
    case on
    case off
}
