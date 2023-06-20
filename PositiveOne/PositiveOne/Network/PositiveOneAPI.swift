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
    case postBoard(parameters: [String: Any])
    case getBoard(boardId: Int)
    case putBoard(boardId: Int, parameters: [String: Any])
    case deleteBoard(boardId: Int)
    case getFeed(type: String, page: String)
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
        case .postBoard:
            return "/board"
        case .getBoard(let boardId),
             .putBoard(let boardId, _),
             .deleteBoard(let boardId):
            return "/board/\(boardId)"
        case .getFeed(let type, _):
            return "/board/all/\(type)"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signInApple,
             .postBoard:
            return .post
        case .getCalendar,
             .getBoard,
             .getFeed:
            return .get
        case .putBoard:
            return .put
        case .deleteBoard:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signInApple(let parameters),
                .postBoard(let parameters),
                .putBoard(_, let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .getFeed(_, let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
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
                    } catch(let error) {
                        print(error)
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
