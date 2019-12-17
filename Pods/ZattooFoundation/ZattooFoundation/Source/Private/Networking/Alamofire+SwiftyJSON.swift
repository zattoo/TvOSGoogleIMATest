//
//  Alamofire.swift
//  Zattoo
//
//  Created by cgoldsby on 9/20/15.
//  Copyright © 2015 Zattoo, Inc. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON


private let timeoutDuration: TimeInterval = 11 //Seconds
private let numberOfConnectionRetries = 3

extension SessionManager {
    
    static let shared = SessionManager()

    convenience init() {
        self.init(configuration: SessionManager.defaultSessionConfiguration)
        retrier = RequestRetrier()
    }

    @discardableResult
    func request(endpoint: ZAPIEndpoint, parameters: Alamofire.Parameters? = nil) -> DataRequest {
        ZattooCookiesManager().addSessionCookieIfMissing()
        return request(Router(endpoint.path), method: endpoint.HTTPMethod, parameters: parameters, headers: self.headers)
    }

    @discardableResult
    func request(url: URLConvertible, method: Alamofire.HTTPMethod = .get, parameters: Alamofire.Parameters? = nil) -> DataRequest {
        ZattooCookiesManager().addSessionCookieIfMissing()
        return request(url, method: method, parameters: parameters, headers: self.headers)
    }
    
    func fire(_ url: URL) {
        let headers = ["User-Agent" : UserAgent().descriptor() + " iOS-universal"]
        request(url, headers: headers)
    }
    
    func fire(_ urls: [URL]) {
        urls.forEach { fire($0) }
    }
    
    // MARK: - Private

    private var headers: [String: String] {
        var headers = ["Accept" : "application/json", "User-Agent" : UserAgent().descriptor()]

        if ProcessInfo.processInfo.isUITesting, let postmanKey = ProcessInfo.processInfo.postmanKey {
            headers["x-api-key"] = postmanKey
        }

        return headers
    }
    
    static private var defaultSessionConfiguration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForResource = timeoutDuration
        configuration.timeoutIntervalForRequest = timeoutDuration
        if let groupIdentifier = ZattooConfiguration.shared.groupId {
            let cookieStorage = HTTPCookieStorage.sharedCookieStorage(forGroupContainerIdentifier: groupIdentifier)
            configuration.httpCookieStorage = cookieStorage
        }
        
        return configuration
    }
}

// MARK: - DataRequest

extension DataRequest {
    
    @discardableResult
    func responseObject<T: SwiftyJsonResponseSerializable>(errorEntity: NetworkEntityError.Type, _ completionHandler: @escaping (URLRequest?, HTTPURLResponse?, Result<T>) -> Void) -> DataRequest {
        let responseSerializer = Request.SwiftyJSONResponseSerializer(errorEntity: errorEntity) {
            json -> T? in
            return T(json: json)
        }
        
        return responseObject(responseSerializer, completionHandler: completionHandler)
    }
    
    // MARK: - Private
    
    private func responseObject<T>(_ responseSerializer: DataResponseSerializer<T>, completionHandler: @escaping (URLRequest?, HTTPURLResponse?, Result<T>) -> Void) -> Self {
        return response(queue: GlobalUserInitiatedQueue, responseSerializer: responseSerializer) {
            response in
            
            if let error = response.result.error as? NetworkEntityError, error == NetworkEntityError(code: .requestCancelled) {
                return
            }
            
            GlobalMainQueue.async {
                completionHandler(response.request, response.response, response.result)
            }
        }
    }
}

// MARK: - Request

extension Request {
    
    static func SwiftyJSONResponseSerializer<T>(errorEntity: NetworkEntityError.Type, serializer: @escaping (_ json: JSON) -> T?) -> DataResponseSerializer<T> {
        return DataResponseSerializer {
            _, response, data, error in
            
            if let error = error {
                return .failure(errorEntity.init(code: (error as NSError).networkError.code, localizedDescriptions:(error as NSError).networkError.localizedDescriptions))
            }
            
            guard let response = response else {
                return .failure(errorEntity.init(code: .invalidResponse))
            }
            
            guard let data = data, !data.isEmpty else {
                return .failure(errorEntity.init(code: .invalidData))
            }
            
            guard let json = try? JSON(data: data) else {
                return .failure(errorEntity.init(code: .invalidJson))
            }
            
            guard response.isStatusCodeValid, let object = serializer(json) else {
                return .failure(errorEntity.init(json: json))
            }
            
            return .success(object)
        }
    }
}

class RequestRetrier: Alamofire.RequestRetrier {

    func should(_ manager: SessionManager, retry request: Request, with error: Swift.Error, completion: @escaping RequestRetryCompletion) {
        let errorCode = (error as NSError).networkError.code
        if errorCode == .noInternetConnection || errorCode == .other {
            if request.retryCount <= numberOfConnectionRetries {
                completion(true, Double(request.retryCount) + 1.0)
            }
            else {
                completion(false, 0.0)
            }
        }
    }
}

// MARK: - Result

extension Result {
    
    func map<T>(_ transform: (Value) -> T) -> Result<T> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }
}

// MARK: - Private

private extension NSError {
    
    var networkError: NetworkEntityError {
        switch code {
        case NSURLErrorNotConnectedToInternet:
            return NetworkEntityError(code: .noInternetConnection)
        case NSURLErrorCancelled:
            return NetworkEntityError(code: .requestCancelled)
        case NSURLErrorTimedOut:
            return NetworkEntityError(code: .timeout)
        default:
            return NetworkEntityError(code: .other)
        }
    }
}

private extension HTTPURLResponse {
    
    var isStatusCodeValid: Bool {
        return 200 ..< 300 ~= statusCode
    }
}
