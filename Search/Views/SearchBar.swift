//
//  SearchBar.swift
//  Search
//
//  Created by Wukong on 2020/9/4.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var store = SearchStore()
    var text: String {
        store.searchState.tfProperty.searchText
    }
    
    var config: SearchBarConfig
    
    struct SearchBarConfig {
        var showIcon: Bool //是否显示放大镜图标
        var placeholder: String //占位文字
    }
    
    
    var body: some View {
        HStack {
            if config.showIcon {
                Image("Search")
                    .resizable()
                    .frame(width: 19, height: 19, alignment: .center)
                    .padding(.leading, 10)
            }
            TextField(config.placeholder, text: $store.searchState.tfProperty.searchText)
                .autocapitalization(.none)
                .font(.system(size: 16))
                .foregroundColor(Color(.c333333))
                .padding(.leading, config.showIcon ? -5 : 10)
            if !self.text.isEmpty {
                Button(action: {
                    self.store.dispatch(action: .textFieldClean)
                }) {
                    Image("Cancel")
                    .resizable()
                    .frame(width: 12, height: 12, alignment: .center)
                        .padding(.trailing, 10)
                }
            }
        }.padding(.vertical, 10)
            .background(Color(.cE9EAEC))
            .cornerRadius(8)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(config: SearchBar.SearchBarConfig(showIcon: true, placeholder: "Tap here to Search"))
    }
}
