

import Foundation
import SwiftUI
internal import Combine

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []{
        didSet{
            saveListItem()
        }
    }
    
    init(){
        getListItems()
    }
    
    func getListItems(){
        
        guard
            let data = UserDefaults.standard.data(forKey: "appstorageItems"),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = decodedData
    }
    
    func deleteListItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveListItem(indexSet: IndexSet, int: Int){
        items.move(fromOffsets: indexSet, toOffset: int)
    }
    
    func addListItem(txt: String){
        items.append(ItemModel(title: txt, isCompleted: false))
    }
    
    func updateListItem(item : ItemModel){
        if let index = items.firstIndex(of: item){
            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
        }
        
    }
    
    func saveListItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "appstorageItems")
        }
    }
    
}
