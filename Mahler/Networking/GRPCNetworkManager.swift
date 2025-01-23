import Foundation
import GRPC
import NIO
import SwiftProtobuf

final class GRPCNetworkManager {
    static let shared = GRPCNetworkManager()
    
    private let host = "localhost"
    private let port: Int = 50051
    
    private var group: EventLoopGroup
    private var channel: ClientConnection
    private var client: User_UserServiceNIOClient
    
    private init() {
        self.group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        self.channel = ClientConnection.insecure(group: group)
            .connect(host: host, port: port)
        
        self.client = User_UserServiceNIOClient(channel: channel)
    }
    
    deinit {
        try? group.syncShutdownGracefully()
    }
    
    // ✅ Create User in backend-auth
    func createUser(auth0ID: String, email: String, username: String?, completion: @escaping (Bool, String?) -> Void) {
        var request = User_CreateUserRequest()
        request.auth0ID = auth0ID
        request.email = email
        if let username = username {
            request.username = username
        }

        print("🔹 Sending CreateUser Request | Auth0ID: \(auth0ID) | Email: \(email) | Username: \(username ?? "None")")

        let call = client.createUser(request)

        call.response.whenComplete { result in
            switch result {
            case .success(let response):
                print("✅ User Created Successfully: \(response.email), Username: \(response.username)")
                completion(true, nil)
            case .failure(let error):
                print("❌ Failed to create user: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
            }
        }
    }
    
    // ✅ Fetch User Data from backend-auth
    func getUser(auth0ID: String, completion: @escaping (User_UserResponse?, String?) -> Void) {
        var request = User_GetUserRequest()
        request.auth0ID = auth0ID

        print("🔹 Sending GetUser Request | Auth0ID: \(auth0ID)")

        let call = client.getUser(request)

        call.response.whenComplete { result in
            switch result {
            case .success(let response):
                print("✅ User Fetched Successfully: \(response.email), Username: \(response.username)")
                completion(response, nil)
            case .failure(let error):
                print("❌ Failed to fetch user: \(error.localizedDescription)")
                completion(nil, error.localizedDescription)
            }
        }
    }

    // ✅ Update Username in backend-auth
    func updateUsername(auth0ID: String, username: String, completion: @escaping (Bool, String?) -> Void) {
        var request = User_UpdateUsernameRequest()
        request.auth0ID = auth0ID
        request.username = username

        print("🔹 Sending UpdateUsername Request | Auth0ID: \(auth0ID) | New Username: \(username)")

        let call = client.updateUsername(request)

        call.response.whenComplete { result in
            switch result {
            case .success(let response):
                print("✅ Username Updated Successfully: \(response.username)")
                completion(true, nil)
            case .failure(let error):
                print("❌ Failed to update username: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
            }
        }
    }
}
