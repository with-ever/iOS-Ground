//
//  Navigation+Extension.swift
//  ground
//
//  Created by TED on 19/09/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class NavigationUtils {
    
    public static func rootView(storyBoard: String, viewControllerName: String) {
        let storyboard = UIStoryboard.init(name: storyBoard, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }

}
