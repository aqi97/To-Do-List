//
//  itemModel.swift
//  concurrancy
//
//  Created by Sheikh Mohamed on 27/08/24.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    let id : String
    let title: String
    let isCompatable : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompatable: Bool) {
        self.id = id
        self.title = title
        self.isCompatable = isCompatable
    }
    
    func updateComplation() -> ItemModel {
        return ItemModel(id: id, title: title, isCompatable: !isCompatable)
    }
}
