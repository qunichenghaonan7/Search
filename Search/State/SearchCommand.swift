//
//  SearchCommand.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import Foundation
import Combine

protocol AppCommand {
    
    /// 执行耗时异步操作，完成后可更新store中的state值进行UI刷新
    /// - Parameter store: 原Store
    func excute(in store: SearchStore)
}

struct SearchCommand: AppCommand {
    let text: String
}

extension SearchCommand {
    func excute(in store: SearchStore) {
        let token = SubscriptionToken()
        SearchOperator(text: text)
            .publisher.sink(receiveCompletion: { (complete) in
                if case .failure(let error) = complete {
                    switch error {
                    case .textEmpty, .unResult:
                        store.dispatch(action: .resultListUpdate(list: []))
                        break
                    }
                }
                token.unsearl()
            }) { (data) in
                store.dispatch(action: .resultListUpdate(list: data.sections))
        }.seal(in: token)
    }
}
