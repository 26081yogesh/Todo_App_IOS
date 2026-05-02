

import SwiftUI

struct NoItemView: View {
    
    @State var isAnimated : Bool = false
    
    var body: some View {
        ScrollView(){
            VStack(spacing: 20){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Are you feeling productive today? Start turning that momentum into results—tap the button below and add a few todo items to stay focused and organized.")
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? Color.red : Color.accentColor)
                        .cornerRadius(30)
                })
                .padding(.horizontal, isAnimated ? 30 : 50)
                .shadow(
                    color: isAnimated ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: isAnimated ? 30 : 10,
                    x: 0, y: isAnimated ? 50: 30)
                .scaleEffect(isAnimated ? 1.1 : 1.0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: animate)
        }
    }
    
    func animate(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1)
                    .repeatForever()
            ){
                isAnimated.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack{
        NoItemView()
    }
    .navigationTitle("Title")
}
