//
//  SearchState.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import Foundation
import Combine


struct SearchState {
    var list: [NetWorkDataModel.SearchListModel] = []
    var tfProperty = TextFieldProperty()
    
    class TextFieldProperty {
        @Published var searchText: String = ""
    }
}
