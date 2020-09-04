//
//  SearchOperator.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import Foundation
import Combine

enum AppError: Error {
    case textEmpty
    case unResult
}

struct SearchOperator {
    var text: String
    
    /// 模拟网络请求，与网络请求逻辑相同，在此用了json文件存储数据的形式进行模拟
    var publisher: AnyPublisher<NetWorkDataModel.SearchSectionModel, AppError> {
        Future { promise in
            if self.text.isEmpty {
                promise(.failure(AppError.textEmpty))
            } else if self.text == "Dyson", let value: NetWorkDataModel = FileHelper.loadBundledJSON(file: "searchData"), !value.data.sections.isEmpty {
                promise(.success(value.data))
            } else {
                promise(.failure(AppError.unResult))
            }
        }
        .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
    }
}
