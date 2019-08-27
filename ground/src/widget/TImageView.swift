//
//  TImageView.swift
//  ground
//
//  Created by TED on 27/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit
import PINRemoteImage
import PINCache

class TImageView: UIImageView {

    public func load(url: String, crop: Crop = Crop.CENTER_CROP, style: Style = Style.RECTANGLE) {
        var placeHolderImage = UIImage.init(named: "ic_default_rectangle")
        switch crop {
        case .CENTER_CROP:
            self.contentMode = .scaleAspectFill
        case .FIT_CENTER:
            self.contentMode = .scaleAspectFit
        }
        
        switch style {
        case .RECTANGLE: placeHolderImage = UIImage.init(named: "ic_default_rectangle")
        case .SQUARE: placeHolderImage = UIImage.init(named: "ic_default_square")
        case .PROFILE: placeHolderImage = UIImage.init(named: "ic_default_profile")
        }
        
        // Load image
        self.pin_updateWithProgress = true
        pin_setImage(from: URL(string: url), placeholderImage: placeHolderImage)
    }
}

///----------------------------------------------------
/// Cache
///----------------------------------------------------
extension UIImageView {
    public static func clearCache() {
        PINRemoteImageManager.shared().cache.removeAllObjects()
        PINRemoteImageManager.shared().defaultImageCache().removeAllObjects()
    }
}


///----------------------------------------------------
/// Enum
///----------------------------------------------------
enum Crop: Int {
    case FIT_CENTER = 1
    case CENTER_CROP = 2
}

enum Style: Int {
    case RECTANGLE = 1
    case SQUARE = 2
    case PROFILE = 3
}



//
//class TImageView: UIImageView {
//
//    ///----------------------------------------------------
//    /// Set image
//    ///----------------------------------------------------
//    public func setTImage(_ url: String?) {
//        setImageDefault(url: url)
//    }
//
//    public func setTImage(_ url: String?, scaleType: ScaleType) {
//        switch scaleType {
//        case .Default:
//            setImageDefault(url: url)
//            self.contentMode = .scaleToFill
//        case .ScaleAspectFill:
//            setImageDefault(url: url)
//        case .ScaleAspectFit:
//            setImageDefault(url: url)
//            self.contentMode = .scaleAspectFit
//        }
//    }
//
//    public func setTImage(_ url: String?, type: ImageType) {
//        self.backgroundColor = .clear
//        switch type {
//        case .None:
//            setImageNone(url: url)
//
//        case .Default:
//            setImageDefault(url: url)
//
//        case .Profile:
//            setImageProfile(url: url)
//        }
//    }
//
//    public func setTImage(_ url: String?, placeHolder: UIImage?) {
//        self.image = nil
//        if url != nil {
//            scaleCenterCrop()
//            let url = URL(string: SystemUtils.getCharisImageUrl(url)!)
//            self.pin_updateWithProgress = true
//            self.pin_setImage(from: url, placeholderImage: placeHolder)
//        }
//    }
//
//    ///----------------------------------------------------
//    /// Set image
//    ///----------------------------------------------------
//    private func setImageNone(url: String?) {
//        self.image = nil
//        if url != nil {
//            scaleCenterCrop()
//            let url = URL(string: SystemUtils.getCharisImageUrl(url)!)
//            self.pin_updateWithProgress = true
//            self.pin_setImage(from: url)
//        }
//    }
//
//    private func setImageProfile(url: String?) {
//        self.image = nil
//        if url != nil {
//            scaleCenterCrop()
//            let url = URL(string: SystemUtils.getCharisImageUrl(url)!)
//            self.pin_updateWithProgress = true
//            self.pin_setImage(from: url, placeholderImage: UIImage.init(named: "ic_default_profile"))
//        }
//    }
//
//    private func setImageDefault(url: String?) {
//        self.image = nil
//        if url != nil {
//            scaleCenterCrop()
//            let url = URL(string: SystemUtils.getCharisImageUrl(url)!)
//            self.pin_updateWithProgress = true
//            // 정사각형인 경우
//            if self.frame.size.width == self.frame.size.height {
//                self.pin_setImage(from: url, placeholderImage: UIImage.init(named: "ic_default_square"))
//            }
//                // 직사각형인 경우
//            else {
//                self.pin_setImage(from: url, placeholderImage: UIImage.init(named: "ic_default_rectangle"))
//            }
//        }
//    }
//
//
//
//    ///----------------------------------------------------
//    /// Scale Crop
//    ///----------------------------------------------------
//    public func scaleCenterCrop() {
//        self.contentMode = .scaleAspectFill
//        self.clipsToBounds = true
//    }
//}
//
//
/////----------------------------------------------------
///// Clear cache
/////----------------------------------------------------
//extension TImageView {
//    // README 이미지 캐시 설정하기
//    public static func setImageCacheSize() {
//        //        // cache is an instance of PINCache as long as you haven't overridden defaultImageCache
//        //        PINCache *cache = (PINCache *)[[PINRemoteImageManager sharedImageManager] cache];
//        //        // Max memory cost is based on number of pixels, we estimate the size of one hundred 600x600 images as our max memory image cache.
//        //        [[cache memoryCache] setCostLimit:600 * 600 * 100 * [[UIScreen mainScreen] scale]];
//        //
//        //        // ~50 MB
//        //        [[cache diskCache] setByteLimit:50 * 1024 * 1024];
//        //        // 30 days
//        //        [[cache diskCache] setAgeLimit:60 * 60 * 24 * 30];
//    }
//
//    public static func clearCache() {
//        PINRemoteImageManager.shared().cache.removeAllObjects()
//        PINRemoteImageManager.shared().defaultImageCache().removeAllObjects()
//    }
//}
//
//
//
//enum ImageType: Int {
//    case None = 0
//    case Default = 1
//    case Profile = 2
//}
//
//
//
//enum ScaleType: Int {
//    case Default = 0
//    case ScaleAspectFill = 1
//    case ScaleAspectFit = 2
//}
