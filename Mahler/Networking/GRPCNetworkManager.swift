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
    
    func createUser(auth0ID: String, email: String, username: String?, completion: @escaping (Bool, String?) -> Void) {
        var request = User_CreateUserRequest()
        request.auth0ID = auth0ID
        request.email = email
        if let username = username {
            request.username = username
        }

        let call = client.createUser(request)

        call.response.whenComplete { result in
            switch result {
            case .success(let response):
                print("✅ User Created: \(response.email)")
                completion(true, nil)
            case .failure(let error):
                print("❌ Failed to create user: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
            }
        }
    }
}
