//
//  ContentView.swift
//  Search
//
//  Created by Wukong on 2020/8/31.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView().navigationBarTitle("Search")
        }.background(Color(.cFAFAFA))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
