//
//  DebugMode.swift
//  ground
//
//  Created by TED on 18/08/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

public class DebugMode {
    private static var releaseMode: Bool = false // true: 마켓 업로드 시 사용되는 버전, false: 개발 기간 때 사용되는 버전
    private static var releaseAPIMode: ServerMode = ServerMode.PRODUCT   // true: 실서버, false: 개발서버
    private static var showLog: Bool = true // true: visible Log, false: gone Log
    private static var showAPILog: Bool = true // true: visible Log, false: gone Log
    
    public static func releaseMode(_ mode: Mode) {
        releaseMode = mode == Mode.RELEASE
    }
    
    public static func apiMode(_ mode: ServerMode) {
        releaseAPIMode = mode
    }
    
    public static func showLog(_ isShow: Bool) {
        showLog = isShow
        showAPILog = isShow
    }
}

public enum ServerMode {
    case PRODUCT
    case DEVELOP
}

public enum Mode {
    case DEBUG
    case RELEASE
}
