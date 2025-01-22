import SwiftUI

@main
struct MahlerApp: App {
    @StateObject private var viewModel = AuthViewModel() // ✅ Ensure this instance is shared

    var body: some Scene {
        WindowGroup {
            if viewModel.isAuthenticated {
                DashboardView(viewModel: viewModel)  // ✅ Pass same instance
            } else {
                LoginView(viewModel: viewModel)  // ✅ Pass same instance
            }
        }
    }
}
