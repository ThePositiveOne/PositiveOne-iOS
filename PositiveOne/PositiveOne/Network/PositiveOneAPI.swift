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
    case getCalendar(date: String)
}

extension PositiveOneAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "http://15.165.18.122:8080")!
    }
    
    var path: String {
        switch self {
        case .signInApple:
            return "/login/apple"
        case .getCalendar(let date):
            return "/board/calendar/\(date)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signInApple:
            return .post
        case.getCalendar:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signInApple(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        case .signInApple:
            return .none
        default:
            return .bearer
        }
    }
    
    
}

extension PositiveOneAPI {
    
    private static func getAuthPlugin() -> AccessTokenPlugin {
        let tokenClosure: (TargetType) -> String = { _ in
            guard let token = Keychain.loadToken() else {
                print("No token")
                return ""
            }
            return token
        }
        return AccessTokenPlugin(tokenClosure: tokenClosure)
    }
    
    static func request<T: Decodable>(target: PositiveOneAPI, dataType: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            let provider = MoyaProvider<PositiveOneAPI>(plugins: [getAuthPlugin(), MoyaCacheablePlugin()])
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


protocol MoyaCacheable {
    typealias MoyaCacheablePolicy = URLRequest.CachePolicy
    var cachePolicy: MoyaCacheablePolicy { get }
}

final class MoyaCacheablePlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let moyaCachableProtocol = target as? MoyaCacheable {
            var cachableRequest = request
            cachableRequest.cachePolicy = moyaCachableProtocol.cachePolicy
            return cachableRequest
        }
        return request
    }
}
