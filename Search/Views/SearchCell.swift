//
//  SearchCell.swift
//  Search
//
//  Created by Wukong on 2020/9/3.
//  Copyright © 2020 Wukong. All rights reserved.
//

import SwiftUI

struct SearchCell: View {
    let result: NetWorkDataModel.SearchModel
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(result.name)
                        .font(.body)
                        .foregroundColor(Color(.c333333))
                    Text(result.stockStatus ? "In-stock" : "Out-of-stock")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.c666666))
                }
                Spacer()
                Text("$" + result.price)
                    .font(.system(size: 12))
                    .foregroundColor(result.stockStatus ? Color(.c6C91F2) : Color(.cA5A5A5))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(result.stockStatus ? Color(.cF5F8FE) : Color(.cF6F6F6))
                    .cornerRadius(65)
                
            }
            Spacer()
            RoundedRectangle(cornerRadius: 0.5, style: .circular).fill(Color(.cFAFAFA)).frame(height:1)
        }
        
    }
}


struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell(result: NetWorkDataModel.SearchModel(id: 1, name: "V11", stockStatus: true, price: "599.99"))
    }
}
