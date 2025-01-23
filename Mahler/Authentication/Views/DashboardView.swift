import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var username: String = ""
    @State private var isEditingUsername = false
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Dashboard")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Welcome, \(viewModel.session?.email ?? "Guest")")
                .font(.body)
                .fontWeight(.semibold)
                .padding()

            // ✅ Username Field & Update Functionality
            if isEditingUsername {
                TextField("Enter your username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: saveUsername) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Save Username")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
            } else {
                Text("Username: \(username.isEmpty ? "Not Set" : username)")
                    .font(.headline)
                    .padding()

                Button(action: { isEditingUsername = true }) {
                    Text("Set Username")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
            }

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
                fetchUsername()
                print("🔹 Dashboard Loaded | User Email: \(viewModel.session?.email ?? "No email")")
                viewModel.hasAppeared = true  // ✅ Prevent multiple logs
            }
        }
    }

    // ✅ Fetch Username from backend-auth
    private func fetchUsername() {
        guard let auth0ID = viewModel.session?.userID else {
            print("❌ User ID not found")
            return
        }

        GRPCNetworkManager.shared.getUser(auth0ID: auth0ID) { user, error in
            if let user = user {
                DispatchQueue.main.async {
                    self.username = user.username.isEmpty ? "" : user.username
                }
            } else {
                print("❌ Failed to fetch username: \(error ?? "Unknown error")")
            }
        }
    }

    // ✅ Save Username to backend-auth
    private func saveUsername() {
        guard let auth0ID = viewModel.session?.userID, !username.isEmpty else {
            print("❌ User ID not found or username empty")
            return
        }
        
        isLoading = true

        GRPCNetworkManager.shared.updateUsername(auth0ID: auth0ID, username: username) { success, error in
            DispatchQueue.main.async {
                isLoading = false
                if success {
                    print("✅ Username updated successfully")
                    isEditingUsername = false
                } else {
                    print("❌ Error updating username: \(error ?? "Unknown error")")
                }
            }
        }
    }
}

// ✅ Fix Preview to Use EnvironmentObject
#Preview {
    DashboardView()
        .environmentObject(AuthViewModel())
}
