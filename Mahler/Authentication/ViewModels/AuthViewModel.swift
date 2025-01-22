import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var session: AuthSession?
    var hasAppeared = false  // ✅ Prevents multiple onAppear triggers

    func login() {
        AuthService.shared.login { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let session):
                    self?.session = session
                    self?.isAuthenticated = true
                    self?.hasAppeared = false  // ✅ Reset flag on login
                    print("✅ Login Successful! User Email: \(session.email ?? "No email")")
                case .failure(let error):
                    print("❌ Login Failed: \(error.localizedDescription)")
                    self?.session = nil
                    self?.isAuthenticated = false
                }
            }
        }
    }

    func logout() {
        AuthService.shared.logout {
            DispatchQueue.main.async {
                self.session = nil
                self.isAuthenticated = false
                self.hasAppeared = false  // ✅ Reset flag on logout
                print("✅ Logged out successfully!")
            }
        }
    }
}
