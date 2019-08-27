//
//  TLabel.swift
//  ground
//
//  Created by TED on 27/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class TLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLabel()
    }
    
    public func initLabel(){
        
    }

    public func setText(_ text: String? = "") {
        self.text = text?.replacingOccurrences(of: "\\n", with: "\n")
    }
}

extension UILabel {
    func setLineSpacing(_ text: String?, lineSpacing: CGFloat, lineHeightMultiple: CGFloat) {
        self.text = text?.replacingOccurrences(of: "\\n", with: "\n")

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = .center

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: text!)
        }

        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }

    public func setLineText(_ text: String?, lineColor: UIColor) {
        self.text = text?.replacingOccurrences(of: "\\n", with: "\n")
        let underLineStyle = NSUnderlineStyle.single.rawValue
        let labelAtributes:[NSAttributedString.Key : Any]  = [
            NSAttributedString.Key.underlineStyle: underLineStyle,
            NSAttributedString.Key.underlineColor: lineColor
        ]
        self.attributedText = NSAttributedString(string: self.text!, attributes: labelAtributes)
    }

    public func setLinkText(_ text: String?, color: UIColor) {
        self.text = text?.replacingOccurrences(of: "\\n", with: "\n")
        self.textColor = color
        let labelAtributes:[NSAttributedString.Key : Any]  = [
            //            NSAttributedStringKey.link: text!,
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.underlineColor: color,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        self.attributedText = NSAttributedString(string: self.text!, attributes: labelAtributes)
    }

    public func setCertainColorText(text: String?, coloredText: String?, color: UIColor?) {
        let range = (text! as NSString).range(of: coloredText!)
        let attributedString = NSMutableAttributedString.init(string: text!)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color!, range: range)
        self.attributedText = attributedString
    }

    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}

extension UILabel {
    // add spacing
    func addCharacterSpacing() {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: -0.4, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }

    // with line
    func withLine(lineColor: UIColor) {
        let underLineStyle = NSUnderlineStyle.single.rawValue
        let labelAtributes:[NSAttributedString.Key : Any]  = [
            NSAttributedString.Key.underlineStyle: underLineStyle,
            NSAttributedString.Key.underlineColor: lineColor
        ]
        self.attributedText = NSAttributedString(string: self.text!, attributes: labelAtributes)
    }
}



// Font
extension UILabel {
    ///----------------------------------------------------
    /// Get font
    ///----------------------------------------------------
    public static func getBlackFont(fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "NotoSansKR-Black", size: fontSize)!
    }

    public static func getBoldFont(fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "NotoSansKR-Bold", size: fontSize)!
    }

    public static func getLightFont(fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "NotoSansKR-Light", size: fontSize)!
    }

    public static func getMediumFont(fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "NotoSansKR-Medium", size: fontSize)!
    }

    public static func getRegularFont(fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "NotoSansKR-Regular", size: fontSize)!
    }


    ///----------------------------------------------------
    /// Set font
    ///----------------------------------------------------
    public func setBlack() {
        self.font = UIFont.init(name: "NotoSansKR-Black", size: self.font.pointSize)
    }

    public func setBold() {
        self.font = UIFont.init(name: "NotoSansKR-Bold", size: self.font.pointSize)
    }

    public func setLight() {
        self.font = UIFont.init(name: "NotoSansKR-Light", size: self.font.pointSize)
    }

    public func setMedium() {
        self.font = UIFont.init(name: "NotoSansKR-Medium", size: self.font.pointSize)
    }

    public func setRegular() {
        self.font = UIFont.init(name: "NotoSansKR-Regular", size: self.font.pointSize)
    }

    ///----------------------------------------------------
    /// Set font - with font size
    ///----------------------------------------------------
    public func setBlack(fontSize: CGFloat) {
        self.font = UIFont.init(name: "NotoSansKR-Black", size: fontSize)
    }

    public func setBold(fontSize: CGFloat) {
        self.font = UIFont.init(name: "NotoSansKR-Bold", size: fontSize)
    }

    public func setLight(fontSize: CGFloat) {
        self.font = UIFont.init(name: "NotoSansKR-Light", size: fontSize)
    }

    public func setMedium(fontSize: CGFloat) {
        self.font = UIFont.init(name: "NotoSansKR-Medium", size: fontSize)
    }

    public func setRegular(fontSize: CGFloat) {
        self.font = UIFont.init(name: "NotoSansKR-Regular", size: fontSize)
    }
}
