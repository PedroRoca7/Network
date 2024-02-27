//
//  NetworkProvider.swift
//  SDKNetwork
//
//  Created by Pedro Henrique on 26/02/24.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case update = "UPDATE"
}

public final class NetworkProvider {
    public static let shared = NetworkProvider()
    
    private init() {}
    
    public func fetchData<T: Decodable>(from urlString: String, method: HTTPMethod = .get, responseType: T.Type, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodeData))
            } catch {
                completionHandler(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
