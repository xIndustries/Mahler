import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: AuthViewModel  // Use @ObservedObject to receive updates

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
            print("🔹 Dashboard Loaded | User Email: \(viewModel.session?.email ?? "No email")")
        }
    }
}

#Preview {
    DashboardView(viewModel: AuthViewModel())
}
