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
    let config = SearchBar.SearchBarConfig(showIcon: true, placeholder: "Tap here to Search")
    
    var body: some View {
        
        VStack {
            ZStack {
                SearchBar(config: config)
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.clear)
            }
            .frame(height: 36, alignment: .leading)
            .padding(.horizontal, 20)
            .onTapGesture {
                self.showDetail.toggle()
            }
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
