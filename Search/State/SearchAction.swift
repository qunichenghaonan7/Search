//
//  SearchAction.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import Foundation

enum SearchAction {
    //输入值发生改变
    case textFieldValueChanged
    
    //输入值清空
    case textFieldClean
    
    //调用网络后，返回符合条件的列表需要刷新UI
    case resultListUpdate(list: [NetWorkDataModel.SearchListModel])
}
