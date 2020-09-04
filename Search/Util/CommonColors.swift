//
//  CommonColors.swift
//  Search
//
//  Created by Wukong on 2020/9/4.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

enum CommonColors: Int {
    case c333333 = 0x333333
    case c666666 = 0x666666
    case cF6F6F6 = 0xF6F6F6
    case cFAFAFA = 0xFAFAFA
    case cA5A5A5 = 0xA5A5A5
    case c6C91F2 = 0x6C91F2
    case cF5F8FE = 0xF5F8FE
}

extension Color {
    
    /// 项目中所有的颜色统一配置，可根据不同模式设置颜色，如dark,light模式等
    init(_ common: CommonColors) {
        self.init(hex: common.rawValue)
    }
}

