import Auth0
import Foundation

class AuthService {
    static let shared = AuthService()

    private let clientId = "gctLBk2FWFmnoSDp4cdegg6mbEUs0bIz"
    private let domain = "dev-5zw8kof1alalx0mi.us.auth0.com"

    private var currentSession: AuthSession?

    func login(completion: @escaping (Result<AuthSession, Error>) -> Void) {
        Auth0
            .webAuth(clientId: clientId, domain: domain)
            .start { result in
                switch result {
                case .success(let credentials):
                    print("🔹 Access Token: \(credentials.accessToken)")
                    print("🔹 ID Token (JWT): \(credentials.idToken)")

                    if let userInfo = self.decodeJWT(credentials.idToken) {
                        print("✅ User ID: \(userInfo.userId)")
                        print("✅ Email: \(userInfo.email ?? "No email")")

                        let session = AuthSession(
                            accessToken: credentials.accessToken,
                            idToken: credentials.idToken,
                            refreshToken: credentials.refreshToken,
                            userName: nil,
                            email: userInfo.email,
                            userID: userInfo.userId  // ✅ Store userID
                        )
                        self.currentSession = session

                        // 🔹 Check if user exists before creating a new one
                        GRPCNetworkManager.shared.getUser(auth0ID: userInfo.userId) { user, error in
                            if let user = user {
                                print("✅ User exists in backend, skipping creation")
                            } else {
                                print("🔹 User does not exist, creating new user")
                                GRPCNetworkManager.shared.createUser(
                                    auth0ID: userInfo.userId,
                                    email: userInfo.email ?? "",
                                    username: nil
                                ) { success, error in
                                    if success {
                                        print("✅ New user stored in backend")
                                    } else {
                                        print("❌ Error storing user: \(error ?? "Unknown error")")
                                    }
                                }
                            }
                        }

                        completion(.success(session))
                    } else {
                        print("❌ Failed to decode JWT")
                        completion(.failure(NSError(domain: "AuthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode ID Token"])))
                    }
                case .failure(let error):
                    print("❌ Login Failed: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }

    func logout(completion: @escaping () -> Void) {
        Auth0
            .webAuth(clientId: clientId, domain: domain)
            .clearSession { result in
                self.currentSession = nil
                print("✅ Logged out successfully!")
                completion()
            }
    }

    func getSession() -> AuthSession? {
        return currentSession
    }

    private func decodeJWT(_ token: String) -> (userId: String, email: String?)? {
        let parts = token.split(separator: ".")
        guard parts.count == 3 else { return nil }

        let payload = parts[1]
        guard let decodedData = Data(base64Encoded: String(payload)
                                        .replacingOccurrences(of: "-", with: "+")
                                        .replacingOccurrences(of: "_", with: "/") + "==") else { return nil }

        do {
            if let json = try JSONSerialization.jsonObject(with: decodedData, options: []) as? [String: Any] {
                let userId = json["sub"] as? String ?? "Unknown ID"
                let email = json["email"] as? String
                return (userId, email)
            }
        } catch {
            print("❌ Failed to decode JWT: \(error.localizedDescription)")
        }
        return nil
    }
}
