//
//  ProductsRepositories.swift
//  MyShop
//
//  Created by Eliott Oblinger on 14/07/2023.
//

import Combine
import Foundation

protocol ProductsRepository: WebRepository {
    func loadProducts() -> AnyPublisher<[Product], Error>
}

struct RealProductsRepository: ProductsRepository {
    typealias DataType = [Product]
    
    let baseURL: String
    
    init(baseURL: String = "https://fakestoreapi.com") {
        self.baseURL = baseURL
    }
    
    func loadProducts() -> AnyPublisher<[Product], Error> {
        return call(endpoint: "/products")
    }
}

struct MockProductsRepository: ProductsRepository {
    typealias DataType = [Product]
    
    let baseURL: String
    
    init(baseURL: String = "") {
        self.baseURL = baseURL
    }
    
    func loadProducts() -> AnyPublisher<[Product], Error> {
        let data = Product.sampleData
        
        return Result
            .success(data)
            .publisher
            .eraseToAnyPublisher()
    }
}
