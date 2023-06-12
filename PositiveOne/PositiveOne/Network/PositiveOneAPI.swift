//
//  PositiveOneAPI.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/09.
//
import Foundation
import Moya

enum PositiveOneAPI {
    case signInApple(paramters: [String: Any])
}

extension PositiveOneAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "http://15.165.18.122:8080")!
    }
    
    var path: String {
        switch self {
        case .signInApple:
            return "/login/apple"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signInApple:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signInApple(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        case .signInApple:
            return .none
        }
    }
    
    
}

extension PositiveOneAPI {
    static func request<T: Decodable>(target: PositiveOneAPI, dataType: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            let provider = MoyaProvider<PositiveOneAPI>()
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data)
                        continuation.resume(returning: data)
                        print("finishRequestAPI \(response.request?.url?.absoluteString ?? "")")
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
//
//    static func request(target: PositiveOneAPI) async throws -> Response {
//        return try await withCheckedThrowingContinuation { continuation in
//            let provider = MoyaProvider<FitftyAPI>(plugins: [getAuthPlugin(), MoyaCacheablePlugin()])
//            provider.request(target) { result in
//                switch result {
//                case .success(let response):
//                    let url = response.request?.url?.absoluteString ?? "nil"
//                    print("finishRequestAPI \(url)")
//                    continuation.resume(returning: response)
//                case .failure(let error):
//                    continuation.resume(throwing: error)
//                }
//            }
//        }
//    }
//
//    private static func getAuthPlugin() -> AccessTokenPlugin {
//        let tokenClosure: (TargetType) -> String = { _ in
//            guard let identifier = UserDefaults.standard.read(key: .userIdentifier) as? String,
//                  let account = UserDefaults.standard.read(key: .userAccount) as? String,
//                  let token = Keychain.loadData(serviceIdentifier: identifier, forKey: account) else {
//                Logger.debug(error: SocialLoginError.noToken, message: "No Token")
//                return ""
//            }
//            return token
//        }
//        return AccessTokenPlugin(tokenClosure: tokenClosure)
//    }
//}
