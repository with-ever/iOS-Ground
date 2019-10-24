//
//  TNavigationBar.swift
//  ground
//
//  Created by TED on 2019/10/22.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

let NAVIGATION_BAR_HEIGHT: CGFloat = 56

@objc public protocol TNavigationBarDelegate {
    @objc optional func actionLeftButton()
    @objc optional func actionRightButton()
}

class TNavigationBar: UIView {

    var imgMainNotice: UIImageView?
    
    var style: TNavigationBarStyle = TNavigationBarStyle.Main
    var navigationWidth: CGFloat = 0
    var navigationHeight: CGFloat = 0
    
    var delegate: TNavigationBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func initNavigationBar(){
        backgroundColor = Color.getKeyColor()
        navigationWidth = self.frame.size.width
        navigationHeight = NAVIGATION_BAR_HEIGHT
        
        switch style {
        case .Main:
            setMainNavigationStyle()
            setTitle(style: .main)
            setLeftButton(style: .menu)
            setRightButton(style: .alarm)
            
        case .Back:
            setLeftButton(style: .back)
        
        case .Write:
            setLeftButton(style: .cancel_text)
            setRightButton(style: .register_text)
        }
    }
    
    private func setMainNavigationStyle() {
        
    }
    
    
}

// Title
extension TNavigationBar {
    private func setTitle(style: TitleStyle) {
        switch style {
        case .main:
            let height: CGFloat = 20
            let width: CGFloat = 329 * height / 76
            let marginX: CGFloat = ((navigationWidth - width) / 2)
            let marginY: CGFloat = ((navigationHeight - height) / 2) + SystemUtils.statusBarHeight
            let title: UIImageView = UIImageView.init(frame: CGRect.init(x: marginX,
                                                                         y: marginY,
                                                                         width: width,
                                                                         height: height))
            title.image = UIImage.init(named: "ic_main_logo")
            addSubview(title)
        }
    }
}


// Left Button
extension TNavigationBar {
    private func setLeftButton(style: LeftButtonStyle) {
        switch style {
        case .menu:
            // imageview
            let imgWidth: CGFloat = 40
            let imgHeight: CGFloat = imgWidth * 96 / 102
            let marginX: CGFloat = ((navigationHeight - imgWidth) / 2)
            let marginY: CGFloat = ((navigationHeight - imgHeight) / 2) + SystemUtils.statusBarHeight
            let img: UIImageView = UIImageView.init(frame: CGRect.init(x: marginX,
                                                                       y: marginY,
                                                                       width: imgWidth,
                                                                       height: imgHeight))
            img.image = UIImage.init(named: "temp_slide_menu")!
            addSubview(img)
            
            // button
            let button: UIButton = UIButton.init(frame: CGRect.init(x: 0,
                                                                    y: SystemUtils.statusBarHeight,
                                                                    width: navigationHeight,
                                                                    height: navigationHeight))
            button.backgroundColor = Color.clear
            button.tag = style.rawValue
            button.addTarget(self, action: #selector(self.actionLeftButton(_:)), for: .touchUpInside)
            addSubview(button)
            
        case .back:
            // imageview
            let imgWidth: CGFloat = 12
            let imgHeight: CGFloat = imgWidth * 76 / 42
            let imgMarginX: CGFloat = 22
            let imgMarginY: CGFloat = ((navigationHeight - imgHeight) / 2) + SystemUtils.statusBarHeight - 5
            let img: UIImageView = UIImageView.init(frame: CGRect.init(x: imgMarginX,
                                                                       y: imgMarginY,
                                                                       width: imgWidth,
                                                                       height: imgHeight))
            img.image = UIImage.init(named: "ic_back")
            addSubview(img)
            
            // back title image
            let titleWidth: CGFloat = 69
            let titleHeight: CGFloat = titleWidth * 58 / 251
            let titleMarginY: CGFloat = ((navigationHeight - titleHeight) / 2) + SystemUtils.statusBarHeight - 5
            let backTitle: UIImageView = UIImageView.init(frame: CGRect.init(x: imgWidth + imgMarginX + 10,
                                                                             y: titleMarginY,
                                                                             width: titleWidth,
                                                                             height: titleHeight))
            backTitle.image = UIImage.init(named: "ic_back_text")
            addSubview(backTitle)
            
            // button
            let button: UIButton = UIButton.init(frame: CGRect.init(x: 0,
                                                                    y: SystemUtils.statusBarHeight,
                                                                    width: navigationHeight + backTitle.frame.width + 10,
                                                                    height: navigationHeight))
            button.backgroundColor = Color.clear
            button.tag = style.rawValue
            button.addTarget(self, action: #selector(self.actionLeftButton(_:)), for: .touchUpInside)
            addSubview(button)
            
        case .cancel_text:
            // title
            let margin: CGFloat = 20
            let title: UILabel = UILabel.init(frame: CGRect.init(x: margin,
                                                                 y: SystemUtils.statusBarHeight,
                                                                 width: 100,
                                                                 height: navigationHeight))
            title.text = "write_navigation_cancel".localized
            title.textColor = Color.white
            title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            title.sizeToFit()
            title.frame.size.height = navigationHeight
            addSubview(title)
            
            // button
            let button: UIButton = UIButton.init(frame: CGRect.init(x: 0,
                                                                    y: SystemUtils.statusBarHeight,
                                                                    width: title.frame.size.width + margin + margin,
                                                                    height: navigationHeight))
            button.backgroundColor = Color.clear
            button.tag = style.rawValue
            button.addTarget(self, action: #selector(self.actionLeftButton(_:)), for: .touchUpInside)
            addSubview(button)
        }
    }
    
    @objc func actionLeftButton(_ sender: UIButton) {
        delegate?.actionLeftButton!()
    }
}


// Right Button
extension TNavigationBar {
    private func setRightButton(style: RightButtonStyle) {
        switch style {
        case .alarm:
            // imageview
            let imgWidth: CGFloat = 20
            let imgHeight: CGFloat = imgWidth * 120 / 96
            let marginX: CGFloat = navigationWidth - ((navigationHeight - imgWidth) / 2) - imgWidth
            let marginY: CGFloat = ((navigationHeight - imgHeight) / 2) + SystemUtils.statusBarHeight
            imgMainNotice = UIImageView.init(frame: CGRect.init(x: marginX,
                                                                y: marginY,
                                                                width: imgWidth,
                                                                height: imgHeight))
            imgMainNotice?.image = GroundImage.shared.icNotice(status: .off)
            addSubview(imgMainNotice!)
            
            // button
            let button: UIButton = UIButton.init(frame: CGRect.init(x: navigationWidth - navigationHeight,
                                                                    y: SystemUtils.statusBarHeight,
                                                                    width: navigationHeight,
                                                                    height: navigationHeight))
            button.backgroundColor = Color.clear
            button.tag = style.rawValue
            button.addTarget(self, action: #selector(self.actionRightButton(_:)), for: .touchUpInside)
            addSubview(button)
            
        case .register_text:
            // title
            let margin: CGFloat = 20
            let title: UILabel = UILabel.init(frame: CGRect.init(x: 0,
                                                                 y: SystemUtils.statusBarHeight,
                                                                 width: 100,
                                                                 height: navigationHeight))
            title.text = "write_navigation_register".localized
            title.textColor = Color.white
            title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            title.sizeToFit()
            title.frame.size.height = navigationHeight
            title.frame.origin.x = navigationWidth - title.frame.size.width - margin
            addSubview(title)
            
            // button
            let button: UIButton = UIButton.init(frame: CGRect.init(x: title.frame.origin.x - margin,
                                                                    y: SystemUtils.statusBarHeight,
                                                                    width: title.frame.size.width + margin + margin,
                                                                    height: navigationHeight))
            button.backgroundColor = Color.clear
            button.tag = style.rawValue
            button.addTarget(self, action: #selector(self.actionRightButton(_:)), for: .touchUpInside)
            addSubview(button)
        }
    }
    
    @objc func actionRightButton(_ sender: UIButton) {
         delegate?.actionRightButton!()
    }
}




enum TNavigationBarStyle: String {
    case Main = "main"
    case Back = "back"
    case Write = "write"
}

enum LeftButtonStyle: Int {
    case menu = 0
    case back = 1
    case cancel_text = 2
}

enum RightButtonStyle: Int {
    case alarm = 0
    case register_text = 1
}

enum TitleStyle {
    case main
}
