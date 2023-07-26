//
//  WebRepository.swift
//  MyShop
//
//  Created by Eliott Oblinger on 14/07/2023.
//
import Foundation
import Combine

protocol WebRepository {
    associatedtype DataType: Decodable
    
    var baseURL: String { get }
}

extension WebRepository {
    func call(endpoint: String) -> AnyPublisher<DataType, Error> {
        guard let url = URL(string: baseURL)?.appendingPathComponent(endpoint) else {
           return Fail(error: NSError(domain: "Invalid URL", code: 0, userInfo: nil))
               .eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: DataType.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
