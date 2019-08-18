//
//  AVPlayerExtension.swift
//  ground
//
//  Created by TED on 19/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit
import AVKit

extension AVPlayer {

    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
    
}
