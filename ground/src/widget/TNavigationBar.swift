//
//  TNavigationBar.swift
//  ground
//
//  Created by TED on 2019/10/22.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

//extension

@IBDesignable
class TNavigationBar: UIView {

    @IBInspectable var style: Int = TNavigationBarStyle.Main.rawValue
    var navigationWidth: CGFloat = 0
    var navigationHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNavigationBar()
    }
    
    public func initNavigationBar(){
        navigationWidth = self.frame.size.width
        navigationHeight = self.frame.size.height
        
        switch style {
        case TNavigationBarStyle.Main.rawValue:
            setMainNavigationStyle()
            setTitle(style: .main)
            setLeftButton(style: .menu)
            setRightButton(style: .alarm)
            
        default: break
        }
    }
    
    private func setMainNavigationStyle() {
        backgroundColor = Color.getKeyColor()

    }
    
    
}

// Title
extension TNavigationBar {
    private func setTitle(style: TitleStyle) {
        switch style {
        case .main:
            let title: UILabel = UILabel.init(frame: CGRect.init(x: navigationHeight, y: 0, width: navigationWidth - navigationHeight - navigationHeight, height: navigationHeight))
            title.textAlignment = .center
            title.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
            title.textColor = Color.white
            title.text = "Ground"
            addSubview(title)
        }
    }
}


// Left Button
extension TNavigationBar {
    private func setLeftButton(style: LeftButtonStyle) {
        switch style {
        case .menu:
            let margin: CGFloat = 5
            let imgWidth: CGFloat = navigationHeight - (margin * 2)
            let img: UIImageView = UIImageView.init(frame: CGRect.init(x: margin, y: margin, width: imgWidth, height: imgWidth))
            img.image = UIImage.init(named: "temp_slide_menu")!
            addSubview(img)
        }
        
        let button: UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: navigationHeight, height: navigationHeight))
        button.backgroundColor = Color.clear
        button.addTarget(self, action: #selector(self.actionLeftButton), for: .touchUpInside)
        addSubview(button)
    }
    
    @objc func actionLeftButton() {
         makeToast("왼쪽버튼 클릭")
    }
}


// Right Button
extension TNavigationBar {
    private func setRightButton(style: RightButtonStyle) {
        switch style {
        case .alarm:
            let margin: CGFloat = 5
            let imgWidth: CGFloat = navigationHeight - (margin * 2)
            let imgX: CGFloat = navigationWidth - margin - imgWidth
            let img: UIImageView = UIImageView.init(frame: CGRect.init(x: imgX, y: margin, width: imgWidth, height: imgWidth))
            img.image = UIImage.init(named: "temp_alarm")!
            addSubview(img)
        }
        
        let button: UIButton = UIButton.init(frame: CGRect.init(x: navigationWidth - navigationHeight, y: 0, width: navigationHeight, height: navigationHeight))
        button.backgroundColor = Color.clear
        button.addTarget(self, action: #selector(self.actionRightButton), for: .touchUpInside)
        addSubview(button)
    }
    
    @objc func actionRightButton() {
         makeToast("오른쪽버튼 클릭")
    }
}




enum TNavigationBarStyle: Int {
    case Main = 0
    case Back = 1
}

enum LeftButtonStyle {
    case menu
}

enum RightButtonStyle {
    case alarm
}

enum TitleStyle {
    case main
}
