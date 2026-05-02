import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ZStack{

            VStack(){
                TextField("Type Something Here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action:{
                    saveListItem()
                }){
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding(14)
        }
        .navigationTitle("Add Todo 🖋️")
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Text Field Is Empty 😱"))
        })
    }
    
    func saveListItem(){
        if(isTextOk()){
            listViewModel.addListItem(txt: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        else{
            showAlert.toggle()
        }
    }
    
    func isTextOk() -> Bool{
        if(textFieldText.isEmpty){
            return false
        }
        return true
    }
    
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
