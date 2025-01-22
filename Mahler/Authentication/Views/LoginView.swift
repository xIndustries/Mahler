import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // ✅ Uses shared instance

    var body: some View {
        VStack(spacing: 20) {
            if viewModel.isAuthenticated {
                DashboardView()  // ✅ No duplicate ViewModel instances
            } else {
                Text("Project Mahler")
                    .font(.headline)
                    .padding()

                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login / Signup")
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

// ✅ Fix Preview to Use EnvironmentObject
#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
