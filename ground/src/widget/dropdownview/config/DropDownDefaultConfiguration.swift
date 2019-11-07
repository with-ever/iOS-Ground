//
//  DropDownDefaultConfiguration.swift
//  DropDown
//
//  Created by shiwei on 2019/1/30.
//

import Foundation

public struct DropDownDefaultMenuProperties: MenuPropertiesType {
    public init() { }
}

public struct DropDownDefaultSurfaceProperties: SurfacePropertiesType {
    public init() { }
}

public struct DropDownDefaultAnimationProperties: AnimationPropertiesType {
    public init() { }
}

public struct DropDownDefaultConfiguration: DropDownConfigurationType {
    public var menu: MenuPropertiesType {
        return DropDownDefaultMenuProperties()
    }
    
    public var surface: SurfacePropertiesType {
        return DropDownDefaultSurfaceProperties()
    }
    
    public var animation: AnimationPropertiesType {
        return DropDownDefaultAnimationProperties()
    }
}
