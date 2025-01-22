import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // ✅ Use global instance

    var body: some View {
        VStack {
            Text("Dashboard")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Welcome, \(viewModel.session?.email ?? "Guest")") // ✅ Show user email
                .font(.body)
                .fontWeight(.semibold)
                .padding()

            Text("This is a protected view.")
                .font(.subheadline)
                .foregroundColor(.gray)

            LogoutButton {
                viewModel.logout()
            }
            .padding(.top, 20)
        }
        .padding()
        .onAppear {
            if !viewModel.hasAppeared {
                print("🔹 Dashboard Loaded | User Email: \(viewModel.session?.email ?? "No email")")
                viewModel.hasAppeared = true  // ✅ Prevent multiple logs
            }
        }
    }
}

// ✅ Fix Preview to Use EnvironmentObject
#Preview {
    DashboardView()
        .environmentObject(AuthViewModel())
}
