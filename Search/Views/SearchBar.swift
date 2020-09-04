//
//  SearchBar.swift
//  Search
//
//  Created by Wukong on 2020/9/3.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text : String
    var config: SearchBarConfig
    
    struct SearchBarConfig {
        var showIcon: Bool //是否显示放大镜图标
        var editEnable: Bool //点击后是否允许输入
        var placeholder: String //占位文字
        var autoEdit: Bool //是否允许自动弹起键盘，暂不可用
    }
    
    class Cordinator : NSObject, UISearchBarDelegate {
        
        @Binding var text : String
        
        init(text : Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
    }
    
    func makeCoordinator() -> SearchBar.Cordinator {
        return Cordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        if !config.showIcon {
            searchBar.searchTextField.leftView = nil
        }
        searchBar.isUserInteractionEnabled = config.editEnable
        searchBar.placeholder = config.placeholder
        searchBar.delegate = context.coordinator
        searchBar.barTintColor = UIColor(named: "Color_FAFAFA")
        searchBar.autocorrectionType = .no
        searchBar.searchBarStyle = .minimal
        if config.autoEdit {
            searchBar.becomeFirstResponder()
        } else {
            searchBar.resignFirstResponder()
        }
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
