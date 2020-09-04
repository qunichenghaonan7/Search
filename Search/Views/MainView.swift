//
//  MainView.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var showDetail = false
    @State var contentString = ""
    let config = SearchBar.SearchBarConfig(showIcon: true, editEnable: false, placeholder: "Tap here to Search",autoEdit: false)
    
    var body: some View {
        
        VStack {
            Button(action: {
                self.showDetail.toggle()
            }, label: {
                SearchBar(text: $contentString, config: config)
                    .padding(.horizontal, 10)
            })

            Spacer()
        }
            .sheet(isPresented: $showDetail) {
                SearchDetailView()
        }.animation(.easeInOut)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
