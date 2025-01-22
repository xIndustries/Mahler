import SwiftUI

@main
struct MahlerApp: App {
    @StateObject private var viewModel = AuthViewModel()  // ✅ Shared instance

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)  // ✅ Inject globally
        }
    }
}
