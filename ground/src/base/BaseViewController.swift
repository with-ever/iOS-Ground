//
//  BaseViewController.swift
//  ground
//
//  Created by TED on 18/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

protocol BaseKeyboardDelegate {
    func showKeyboard(keyboardHeight: CGFloat)
    func hideKeyboard(keyboardHeight: CGFloat)
}

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: keyboard
    var scrollView: UIScrollView!
    
    var showKeyboard: Bool! = false
    var keyboardHeight: CGFloat! = -1
    
    var delegateKeybaord: BaseKeyboardDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    ///----------------------------------------------------
    /// Swipe back screen
    ///----------------------------------------------------
    public func useSwipeBackScreen() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    public func disableUseSwipeBackScreen() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}


///----------------------------------------------------
/// Keyboard
///----------------------------------------------------
extension BaseViewController {
    ///----------------------------------------------------
    /// Keyboard
    ///----------------------------------------------------
    public func useKeyboard(scrollView: UIScrollView) {
        self.scrollView = scrollView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    public func useKeyboardEvent(delegate: BaseKeyboardDelegate) {
        delegateKeybaord = delegate
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardDidShow(_ info: NSNotification) {
        if !showKeyboard {
            showKeyboard = true
            let userInfo = info.userInfo!
            var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            if keyboardHeight <= 0 {
                keyboardHeight = keyboardFrame.size.height + 20
            }
            
            if scrollView != nil {
                var contentInset: UIEdgeInsets = self.scrollView.contentInset
                contentInset.bottom = keyboardHeight
                scrollView.contentInset = contentInset
            }
            
            delegateKeybaord?.showKeyboard(keyboardHeight: keyboardHeight)
        }
    }
    
    @objc func keyboardDidHide(_ info: NSNotification) {
        if showKeyboard {
            showKeyboard = false
            
            if scrollView != nil {
                let contentInset: UIEdgeInsets = .zero
                scrollView.contentInset = contentInset
            }
            
            delegateKeybaord?.hideKeyboard(keyboardHeight: keyboardHeight)
        }
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}


///----------------------------------------------------
/// Navigation Bar
///----------------------------------------------------
extension BaseViewController {
    
    public func setMainNavigationBar(delegate: TNavigationBarDelegate) {
        let navigationBar = TNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: SystemUtils.screenWidth, height: NAVIGATION_BAR_HEIGHT + SystemUtils.statusBarHeight))
        navigationBar.style = .Main
        navigationBar.delegate = delegate
        navigationBar.initNavigationBar()
        view.addSubview(navigationBar)
    }
    
    public func setBackNavigationBar(delegate: TNavigationBarDelegate) {
        let navigationBar = TNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: SystemUtils.screenWidth, height: NAVIGATION_BAR_HEIGHT + SystemUtils.statusBarHeight))
        navigationBar.style = .Back
        navigationBar.delegate = delegate
        navigationBar.initNavigationBar()
        view.addSubview(navigationBar)
    }
    
    public func setWriteNavigationBar(delegate: TNavigationBarDelegate) {
        let navigationBar = TNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: SystemUtils.screenWidth, height: NAVIGATION_BAR_HEIGHT + SystemUtils.statusBarHeight))
        navigationBar.style = .Write
        navigationBar.delegate = delegate
        navigationBar.initNavigationBar()
        view.addSubview(navigationBar)
    }
    
}
