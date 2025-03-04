import Foundation

struct AuthSession: Codable {
    let accessToken: String
    let idToken: String
    var refreshToken: String?
    var userName: String?
    var email: String?
    var userID: String  // ✅ Added userID field

    init(accessToken: String, idToken: String, refreshToken: String? = nil, userName: String? = nil, email: String? = nil, userID: String) {
        self.accessToken = accessToken
        self.idToken = idToken
        self.refreshToken = refreshToken
        self.userName = userName
        self.email = email
        self.userID = userID  // ✅ Ensure userID is stored
    }
}
