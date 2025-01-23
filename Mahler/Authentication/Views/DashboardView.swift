import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // ✅ Use global instance
    @State private var username: String = ""
    @State private var isEditingUsername = false
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            // Profile Picture
            Image(systemName: "person.crop.circle.fill") // Placeholder Profile Pic
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .padding(.top, 20)

            // User Information
            VStack(spacing: 5) {
                if isEditingUsername {
                    TextField("Enter your username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Button(action: saveUsername) {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Save Username")
                                .font(.system(size: 14, weight: .bold))
                                .frame(width: 120, height: 35)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                } else {
                    Text(username.isEmpty ? "Not Set" : username)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)

                    Text(viewModel.session?.email ?? "Guest")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 10)

            // Stats Section (Placeholder for now)
            HStack(spacing: 40) {
                ProfileStat(value: "12", label: "Posts")
                ProfileStat(value: "230", label: "Followers")
                ProfileStat(value: "180", label: "Following")
            }
            .padding(.top, 20)

            // Edit Profile Button
            if !isEditingUsername {
                Button(action: { isEditingUsername = true }) {
                    Text("Edit Profile")
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 140, height: 35)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }

            Spacer()

            // Logout Button
            LogoutButton {
                viewModel.logout()
            }
            .padding(.bottom, 20)
        }
        .padding()
        .onAppear {
            if !viewModel.hasAppeared {
                fetchUsername()
                print("🔹 Dashboard Loaded | User Email: \(viewModel.session?.email ?? "No email")")
                viewModel.hasAppeared = true
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

// ✅ Component for Profile Stats
struct ProfileStat: View {
    var value: String
    var label: String

    var body: some View {
        VStack {
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

// ✅ Fix Preview to Use EnvironmentObject
#Preview {
    DashboardView()
        .environmentObject(AuthViewModel())
}
