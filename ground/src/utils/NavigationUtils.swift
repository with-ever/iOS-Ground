//
//  Navigation+Extension.swift
//  ground
//
//  Created by TED on 19/09/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

extension BaseViewController {
    
    public func rootView(storyBoard: String, viewControllerName: String) {
        NavigationUtils.rootView(storyBoard: storyBoard, viewControllerName: viewControllerName)
    }

    public func pushView(storyBoard: String, viewControllerName: String, isAnimation: Bool = true) {
        NavigationUtils.pushView(navigationController: navigationController, storyBoard: storyBoard, viewControllerName: viewControllerName, isAnimation: isAnimation)
    }
    
    public func pushBack(isAnimation: Bool = true) {
        NavigationUtils.pushBack(navigationController: navigationController, isAnimation: isAnimation)
    }
    
    public func pushRootBack(isAnimation: Bool = true) {
        NavigationUtils.pushRootBack(navigationController: navigationController, isAnimation: isAnimation)
    }
}


public class NavigationUtils {
    
    public static func rootView(storyBoard: String, viewControllerName: String) {
        let storyboard = UIStoryboard.init(name: storyBoard, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }

    public static func pushView(navigationController: UINavigationController?, storyBoard: String, viewControllerName: String, isAnimation: Bool = true) {
        let sb = UIStoryboard.init(name: storyBoard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerName)
        navigationController?.pushViewController(vc, animated: isAnimation)
    }
    
    public static func pushBack(navigationController: UINavigationController?, isAnimation: Bool = true) {
        navigationController?.popViewController(animated: isAnimation)
    }
    
    public static func pushRootBack(navigationController: UINavigationController?, isAnimation: Bool = true) {
        navigationController?.popToRootViewController(animated: isAnimation)
    }
    
}
