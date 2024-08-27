//
//  ListRowView.swift
//  concurrancy
//
//  Created by Sheikh Mohamed on 26/08/24.
//

import SwiftUI


struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack {
            Image(systemName:item.isCompatable ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompatable ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Preview: PreviewProvider {
    static var item1 = ItemModel(title: "First", isCompatable: false)
    static var item2 = ItemModel(title: "secound", isCompatable: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1 )
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}

