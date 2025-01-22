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
                    if let userInfo = self.decodeJWT(credentials.idToken) {
                        print("User ID: \(userInfo.userId)")
                        print("Email: \(userInfo.email ?? "No email")")

                        let session = AuthSession(
                            accessToken: credentials.accessToken,
                            idToken: credentials.idToken,
                            refreshToken: credentials.refreshToken,
                            userName: userInfo.email,
                            email: userInfo.email // ✅ Store email
                        )
                        self.currentSession = session
                        completion(.success(session))
                    } else {
                        completion(.failure(NSError(domain: "AuthService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode ID Token"])))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func logout(completion: @escaping () -> Void) {
        Auth0
            .webAuth(clientId: clientId, domain: domain)
            .clearSession { result in
                self.currentSession = nil
                completion()
            }
    }

    func getSession() -> AuthSession? {
        return currentSession
    }

    // ✅ Decode JWT Token to extract user email
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
            print("Failed to decode JWT: \(error.localizedDescription)")
        }
        return nil
    }
}
