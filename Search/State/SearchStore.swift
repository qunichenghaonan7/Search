//
//  SearchStore.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import Foundation
import Combine

class SearchStore: ObservableObject {
    @Published var searchState = SearchState()
    private let bag = DisposeBag()
    
    
    /// 此方法中订阅$searchText的值，在其改变时调用网络请求（模拟），更新UI
    init() {
        searchState.tfProperty.$searchText.debounce(for: .seconds(0.1), scheduler: DispatchQueue.main).sink { (_) in
            self.dispatch(action: .textFieldValueChanged)
        }.add(to: bag)
    }
    
    
    /// 在View点击或者Command异步完成后只调用次方法，返回的state用来即时刷新UI，command用来执行异步耗时方法，完成后再次刷新UI
    /// - Parameter action: 事件集
    func dispatch(action: SearchAction) {
        let result = SearchStore.stateOperator(state: searchState, action: action)
        searchState = result.0
        if let command = result.1 {
            command.excute(in: self)
        }
    }
    
}

private extension SearchStore {
    
    /// Store内部调用，更新State和Command
    /// - Parameters:
    ///   - state: 原State
    ///   - action: 事件
    /// - Returns: 更新后的State和Command
    static func stateOperator(state: SearchState, action: SearchAction) -> (SearchState, AppCommand?) {
        var state = state
        var appCommand: SearchCommand?
        switch action {
        case .textFieldValueChanged:
            appCommand = SearchCommand(text: state.tfProperty.searchText)
            break
        case .textFieldClean:
            state.tfProperty.searchText = ""
            break
        case .resultListUpdate(list: let list):
            state.list = list
            break
        }
        return (state, appCommand)
    }
}


class DisposeBag {
    private var values: [AnyCancellable] = []
    func add(_ value: AnyCancellable) {
        values.append(value)
    }
}

extension AnyCancellable {
    func add(to bag: DisposeBag) {
        bag.add(self)
    }
}

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unsearl() {
        cancellable = nil
    }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
