import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel  // ✅ Now receives updates

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isAuthenticated {
                DashboardView(viewModel: viewModel)  // ✅ Route to Dashboard with correct instance
            } else {
                Text("Please log in to continue.")
                    .font(.headline)
                    .padding()

                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login with Auth0")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

// ✅ Fix Preview to Pass a Mock ViewModel
#Preview {
    LoginView(viewModel: AuthViewModel())
}
