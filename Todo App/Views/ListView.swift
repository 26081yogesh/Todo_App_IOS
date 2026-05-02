import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack {
            
            if listViewModel.items.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateListItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteListItem)
                    .onMove(perform: listViewModel.moveListItem)
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }
            }
        }
    }
    
    
}

//MARK: PREVIEW
#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}
