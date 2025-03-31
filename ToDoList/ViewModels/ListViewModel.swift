//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Van Dat on 04/03/2025.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var items : [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let item_key : String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second!", isCompleted: true),
//            ItemModel(title: "Third", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: item_key),
            let saveItems = try?JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from : IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
//       if let index = items.firstIndex {(existingItem)-> Bool in
//            return existingItem.id == item.id
//       }{
//           
//       }
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: item_key)
        }
    }
    
}
