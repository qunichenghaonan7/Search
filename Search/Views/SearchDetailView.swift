//
//  SearchDetailView.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

struct SearchDetailView: View {
    
    @ObservedObject var store = SearchStore()
    
    let config = SearchBar.SearchBarConfig(showIcon: false, editEnable: true, placeholder: "Input to Search", autoEdit: false)
    
    var body: some View {
        VStack {
            //只有在From中时，更改config.autoEdite值为true，才能自动弹起键盘，否则会崩溃，猜测是目前swiftUI版本 bug
//            Form {
//                SearchBar(text: $store.searchState.tfProperty.searchText, config: config)
//                .padding(.horizontal, 5)
//            }
            SearchBar(text: $store.searchState.tfProperty.searchText, config: config)
                .padding(.horizontal, 5)
            if store.searchState.tfProperty.searchText.isEmpty {
                Spacer()
            } else if store.searchState.list.isEmpty {
                Text("No result")
                    .font(.system(size: 16))
                    .foregroundColor(Color(.c666666))
                    .padding(.top, 50)
            } else {
                ScrollView {
                    ForEach(store.searchState.list, id: \.self) { item in
                        VStack {
                            Text(item.title)
                                .font(.system(size: 16))
                                .foregroundColor(Color(.c666666))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 40)
                                .padding(.leading, 15)
                                .background(Color(.cFAFAFA))
                            ForEach(item.list, id: \.self) {
                                cell in
                                SearchCell(result: cell)
                            }
                            .frame(height: 62)
                            .padding(.horizontal, 15)
                            .background(Color.white)
                        }
                    }
                }
            }
            Spacer()
        }.background(Color(.cFAFAFA)).navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView()
    }
}
