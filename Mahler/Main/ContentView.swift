import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if viewModel.isAuthenticated {
            DashboardView()
        } else {
            LoginView()
        }
    }
}

// ✅ Fix Preview to Use EnvironmentObject
#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
