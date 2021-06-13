//
//  ListViewModel.swift
//  TodoList
//
//  Created by Eʟᴅᴀʀ Tᴇɴɢɪᴢᴏᴠ on 13.06.2021.
//

import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
 
    let itemsKey = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        guard let getData = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        items = getData
    }
    
    
    //Change isComplete
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    //Append new item in list
    func appendItem(title: String) {
      
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        
    }
    //Delete item from list
    func deleteItem(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    //Move items in list
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: itemsKey)
        }
    }
}
