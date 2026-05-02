import SwiftUI

struct ListRowView: View{
    
    let item: ItemModel
    
    var body: some View{
        HStack(){
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

//MARK: PREVIEW
#Preview {
    let item1 = ItemModel(title: "Hello World", isCompleted: false)
    let item2 = ItemModel(title: "Hello World", isCompleted: true)
    Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
