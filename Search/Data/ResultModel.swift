//
//  ResultModel.swift
//  Search
//
//  Created by Wukong on 2020/9/1.
//  Copyright © 2020 Wukong. All rights reserved.
//

import Foundation

struct NetWorkDataModel: Codable {
    let code: Int
    let data: SearchSectionModel
    
    struct SearchSectionModel: Codable, Hashable {
        let sections: [SearchListModel]
    }
    
    
    struct SearchListModel: Codable, Hashable {
        let title: String
        let list: [SearchModel]
    }
    
    
    struct SearchModel: Codable, Hashable {
        let id: Int
        let name: String
        let stockStatus: Bool
        let price: String
        
    }
}

