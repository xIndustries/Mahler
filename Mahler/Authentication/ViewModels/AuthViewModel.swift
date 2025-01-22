import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var session: AuthSession? {
        didSet {
            if session != nil {
                isAuthenticated = true
            }
        }
    }

    func login() {
        AuthService.shared.login { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let session):
                    self?.session = session  // ✅ Now properly updates session
                    print("✅ Login Successful! User Email: \(session.email ?? "No email")")
                case .failure(let error):
                    self?.session = nil
                    self?.isAuthenticated = false
                    print("❌ Login Failed: \(error.localizedDescription)")
                }
            }
        }
    }

    func logout() {
        AuthService.shared.logout {
            DispatchQueue.main.async {
                self.session = nil
                self.isAuthenticated = false
                print("✅ Logged out successfully!")
            }
        }
    }
}
