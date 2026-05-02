import SwiftUI

@main
struct Todo_AppApp: App {

    @StateObject var listViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
