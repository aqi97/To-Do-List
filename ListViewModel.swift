//
//  ListViewModel.swift
//  concurrancy
//
//  Created by Sheikh Mohamed on 27/08/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var item: [ItemModel] = [] {
        didSet {
            saveData()
        }
    }
    
    let itemKey: String = "item_list"
    
    init() {
        getItem()
    }
    
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let saveditems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.item = saveditems
    }
        func deleatItem(indexSet: IndexSet) {
            item.remove(atOffsets: indexSet)
        }
        
        func onMoveItem(from: IndexSet, to: Int) {
            item.move(fromOffsets: from, toOffset: to)
        }
        
        func addItem(title:String) {
            let newItem = ItemModel(title: title, isCompatable: false)
            item.append(newItem)
        }
        func updateItem(updatedItem: ItemModel) {
            if let index = item.firstIndex(where: { $0.id == updatedItem.id }) {
                item[index] = updatedItem.updateComplation()
            }
        }
        func saveData() {
            if let encodedData = try? JSONEncoder().encode(item){
                UserDefaults.standard.set(encodedData, forKey: itemKey)
            }
        }
        
    }

