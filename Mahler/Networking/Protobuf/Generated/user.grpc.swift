//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: user.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// UserService defines the gRPC service for user operations.
///
/// Usage: instantiate `User_UserServiceClient`, then call methods of this protocol to make API calls.
internal protocol User_UserServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: User_UserServiceClientInterceptorFactoryProtocol? { get }

  func createUser(
    _ request: User_CreateUserRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_CreateUserRequest, User_UserResponse>

  func getUser(
    _ request: User_GetUserRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_GetUserRequest, User_UserResponse>

  func updateUser(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_UpdateUserRequest, User_UserResponse>

  func updateUsername(
    _ request: User_UpdateUsernameRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_UpdateUsernameRequest, User_UserResponse>

  func deleteUser(
    _ request: User_DeleteUserRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<User_DeleteUserRequest, User_DeleteUserResponse>
}

extension User_UserServiceClientProtocol {
  internal var serviceName: String {
    return "user.UserService"
  }

  /// Create a new user in the database.
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createUser(
    _ request: User_CreateUserRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_CreateUserRequest, User_UserResponse> {
    return self.makeUnaryCall(
      path: User_UserServiceClientMetadata.Methods.createUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateUserInterceptors() ?? []
    )
  }

  /// Retrieve user details by Auth0 ID.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getUser(
    _ request: User_GetUserRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_GetUserRequest, User_UserResponse> {
    return self.makeUnaryCall(
      path: User_UserServiceClientMetadata.Methods.getUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserInterceptors() ?? []
    )
  }

  /// Update an existing user's data (e.g., email).
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateUser(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_UpdateUserRequest, User_UserResponse> {
    return self.makeUnaryCall(
      path: User_UserServiceClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  /// Update only the username for an existing user.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateUsername.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateUsername(
    _ request: User_UpdateUsernameRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_UpdateUsernameRequest, User_UserResponse> {
    return self.makeUnaryCall(
      path: User_UserServiceClientMetadata.Methods.updateUsername.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUsernameInterceptors() ?? []
    )
  }

  /// Delete a user by Auth0 ID.
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteUser(
    _ request: User_DeleteUserRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<User_DeleteUserRequest, User_DeleteUserResponse> {
    return self.makeUnaryCall(
      path: User_UserServiceClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension User_UserServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "User_UserServiceNIOClient")
internal final class User_UserServiceClient: User_UserServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: User_UserServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: User_UserServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the user.UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: User_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct User_UserServiceNIOClient: User_UserServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: User_UserServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the user.UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: User_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// UserService defines the gRPC service for user operations.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol User_UserServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: User_UserServiceClientInterceptorFactoryProtocol? { get }

  func makeCreateUserCall(
    _ request: User_CreateUserRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<User_CreateUserRequest, User_UserResponse>

  func makeGetUserCall(
    _ request: User_GetUserRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<User_GetUserRequest, User_UserResponse>

  func makeUpdateUserCall(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<User_UpdateUserRequest, User_UserResponse>

  func makeUpdateUsernameCall(
    _ request: User_UpdateUsernameRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<User_UpdateUsernameRequest, User_UserResponse>

  func makeDeleteUserCall(
    _ request: User_DeleteUserRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<User_DeleteUserRequest, User_DeleteUserResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension User_UserServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return User_UserServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: User_UserServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeCreateUserCall(
    _ request: User_CreateUserRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<User_CreateUserRequest, User_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.createUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateUserInterceptors() ?? []
    )
  }

  internal func makeGetUserCall(
    _ request: User_GetUserRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<User_GetUserRequest, User_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.getUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserInterceptors() ?? []
    )
  }

  internal func makeUpdateUserCall(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<User_UpdateUserRequest, User_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  internal func makeUpdateUsernameCall(
    _ request: User_UpdateUsernameRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<User_UpdateUsernameRequest, User_UserResponse> {
    return self.makeAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.updateUsername.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUsernameInterceptors() ?? []
    )
  }

  internal func makeDeleteUserCall(
    _ request: User_DeleteUserRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<User_DeleteUserRequest, User_DeleteUserResponse> {
    return self.makeAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension User_UserServiceAsyncClientProtocol {
  internal func createUser(
    _ request: User_CreateUserRequest,
    callOptions: CallOptions? = nil
  ) async throws -> User_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.createUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateUserInterceptors() ?? []
    )
  }

  internal func getUser(
    _ request: User_GetUserRequest,
    callOptions: CallOptions? = nil
  ) async throws -> User_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.getUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetUserInterceptors() ?? []
    )
  }

  internal func updateUser(
    _ request: User_UpdateUserRequest,
    callOptions: CallOptions? = nil
  ) async throws -> User_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.updateUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? []
    )
  }

  internal func updateUsername(
    _ request: User_UpdateUsernameRequest,
    callOptions: CallOptions? = nil
  ) async throws -> User_UserResponse {
    return try await self.performAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.updateUsername.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateUsernameInterceptors() ?? []
    )
  }

  internal func deleteUser(
    _ request: User_DeleteUserRequest,
    callOptions: CallOptions? = nil
  ) async throws -> User_DeleteUserResponse {
    return try await self.performAsyncUnaryCall(
      path: User_UserServiceClientMetadata.Methods.deleteUser.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct User_UserServiceAsyncClient: User_UserServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: User_UserServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: User_UserServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol User_UserServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'createUser'.
  func makeCreateUserInterceptors() -> [ClientInterceptor<User_CreateUserRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when invoking 'getUser'.
  func makeGetUserInterceptors() -> [ClientInterceptor<User_GetUserRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when invoking 'updateUser'.
  func makeUpdateUserInterceptors() -> [ClientInterceptor<User_UpdateUserRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when invoking 'updateUsername'.
  func makeUpdateUsernameInterceptors() -> [ClientInterceptor<User_UpdateUsernameRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when invoking 'deleteUser'.
  func makeDeleteUserInterceptors() -> [ClientInterceptor<User_DeleteUserRequest, User_DeleteUserResponse>]
}

internal enum User_UserServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "UserService",
    fullName: "user.UserService",
    methods: [
      User_UserServiceClientMetadata.Methods.createUser,
      User_UserServiceClientMetadata.Methods.getUser,
      User_UserServiceClientMetadata.Methods.updateUser,
      User_UserServiceClientMetadata.Methods.updateUsername,
      User_UserServiceClientMetadata.Methods.deleteUser,
    ]
  )

  internal enum Methods {
    internal static let createUser = GRPCMethodDescriptor(
      name: "CreateUser",
      path: "/user.UserService/CreateUser",
      type: GRPCCallType.unary
    )

    internal static let getUser = GRPCMethodDescriptor(
      name: "GetUser",
      path: "/user.UserService/GetUser",
      type: GRPCCallType.unary
    )

    internal static let updateUser = GRPCMethodDescriptor(
      name: "UpdateUser",
      path: "/user.UserService/UpdateUser",
      type: GRPCCallType.unary
    )

    internal static let updateUsername = GRPCMethodDescriptor(
      name: "UpdateUsername",
      path: "/user.UserService/UpdateUsername",
      type: GRPCCallType.unary
    )

    internal static let deleteUser = GRPCMethodDescriptor(
      name: "DeleteUser",
      path: "/user.UserService/DeleteUser",
      type: GRPCCallType.unary
    )
  }
}

/// UserService defines the gRPC service for user operations.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol User_UserServiceProvider: CallHandlerProvider {
  var interceptors: User_UserServiceServerInterceptorFactoryProtocol? { get }

  /// Create a new user in the database.
  func createUser(request: User_CreateUserRequest, context: StatusOnlyCallContext) -> EventLoopFuture<User_UserResponse>

  /// Retrieve user details by Auth0 ID.
  func getUser(request: User_GetUserRequest, context: StatusOnlyCallContext) -> EventLoopFuture<User_UserResponse>

  /// Update an existing user's data (e.g., email).
  func updateUser(request: User_UpdateUserRequest, context: StatusOnlyCallContext) -> EventLoopFuture<User_UserResponse>

  /// Update only the username for an existing user.
  func updateUsername(request: User_UpdateUsernameRequest, context: StatusOnlyCallContext) -> EventLoopFuture<User_UserResponse>

  /// Delete a user by Auth0 ID.
  func deleteUser(request: User_DeleteUserRequest, context: StatusOnlyCallContext) -> EventLoopFuture<User_DeleteUserResponse>
}

extension User_UserServiceProvider {
  internal var serviceName: Substring {
    return User_UserServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_CreateUserRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeCreateUserInterceptors() ?? [],
        userFunction: self.createUser(request:context:)
      )

    case "GetUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_GetUserRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeGetUserInterceptors() ?? [],
        userFunction: self.getUser(request:context:)
      )

    case "UpdateUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_UpdateUserRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? [],
        userFunction: self.updateUser(request:context:)
      )

    case "UpdateUsername":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_UpdateUsernameRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeUpdateUsernameInterceptors() ?? [],
        userFunction: self.updateUsername(request:context:)
      )

    case "DeleteUser":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_DeleteUserRequest>(),
        responseSerializer: ProtobufSerializer<User_DeleteUserResponse>(),
        interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? [],
        userFunction: self.deleteUser(request:context:)
      )

    default:
      return nil
    }
  }
}

/// UserService defines the gRPC service for user operations.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol User_UserServiceAsyncProvider: CallHandlerProvider, Sendable {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: User_UserServiceServerInterceptorFactoryProtocol? { get }

  /// Create a new user in the database.
  func createUser(
    request: User_CreateUserRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> User_UserResponse

  /// Retrieve user details by Auth0 ID.
  func getUser(
    request: User_GetUserRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> User_UserResponse

  /// Update an existing user's data (e.g., email).
  func updateUser(
    request: User_UpdateUserRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> User_UserResponse

  /// Update only the username for an existing user.
  func updateUsername(
    request: User_UpdateUsernameRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> User_UserResponse

  /// Delete a user by Auth0 ID.
  func deleteUser(
    request: User_DeleteUserRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> User_DeleteUserResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension User_UserServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return User_UserServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return User_UserServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: User_UserServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_CreateUserRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeCreateUserInterceptors() ?? [],
        wrapping: { try await self.createUser(request: $0, context: $1) }
      )

    case "GetUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_GetUserRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeGetUserInterceptors() ?? [],
        wrapping: { try await self.getUser(request: $0, context: $1) }
      )

    case "UpdateUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_UpdateUserRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeUpdateUserInterceptors() ?? [],
        wrapping: { try await self.updateUser(request: $0, context: $1) }
      )

    case "UpdateUsername":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_UpdateUsernameRequest>(),
        responseSerializer: ProtobufSerializer<User_UserResponse>(),
        interceptors: self.interceptors?.makeUpdateUsernameInterceptors() ?? [],
        wrapping: { try await self.updateUsername(request: $0, context: $1) }
      )

    case "DeleteUser":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<User_DeleteUserRequest>(),
        responseSerializer: ProtobufSerializer<User_DeleteUserResponse>(),
        interceptors: self.interceptors?.makeDeleteUserInterceptors() ?? [],
        wrapping: { try await self.deleteUser(request: $0, context: $1) }
      )

    default:
      return nil
    }
  }
}

internal protocol User_UserServiceServerInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when handling 'createUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateUserInterceptors() -> [ServerInterceptor<User_CreateUserRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when handling 'getUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetUserInterceptors() -> [ServerInterceptor<User_GetUserRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when handling 'updateUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateUserInterceptors() -> [ServerInterceptor<User_UpdateUserRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when handling 'updateUsername'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateUsernameInterceptors() -> [ServerInterceptor<User_UpdateUsernameRequest, User_UserResponse>]

  /// - Returns: Interceptors to use when handling 'deleteUser'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDeleteUserInterceptors() -> [ServerInterceptor<User_DeleteUserRequest, User_DeleteUserResponse>]
}

internal enum User_UserServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "UserService",
    fullName: "user.UserService",
    methods: [
      User_UserServiceServerMetadata.Methods.createUser,
      User_UserServiceServerMetadata.Methods.getUser,
      User_UserServiceServerMetadata.Methods.updateUser,
      User_UserServiceServerMetadata.Methods.updateUsername,
      User_UserServiceServerMetadata.Methods.deleteUser,
    ]
  )

  internal enum Methods {
    internal static let createUser = GRPCMethodDescriptor(
      name: "CreateUser",
      path: "/user.UserService/CreateUser",
      type: GRPCCallType.unary
    )

    internal static let getUser = GRPCMethodDescriptor(
      name: "GetUser",
      path: "/user.UserService/GetUser",
      type: GRPCCallType.unary
    )

    internal static let updateUser = GRPCMethodDescriptor(
      name: "UpdateUser",
      path: "/user.UserService/UpdateUser",
      type: GRPCCallType.unary
    )

    internal static let updateUsername = GRPCMethodDescriptor(
      name: "UpdateUsername",
      path: "/user.UserService/UpdateUsername",
      type: GRPCCallType.unary
    )

    internal static let deleteUser = GRPCMethodDescriptor(
      name: "DeleteUser",
      path: "/user.UserService/DeleteUser",
      type: GRPCCallType.unary
    )
  }
}
