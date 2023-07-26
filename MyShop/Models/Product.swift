//
//  Product.swift
//  MyShop
//
//  Created by Eliott Oblinger on 14/07/2023.
//

import Foundation

struct Product: Codable, Equatable, Hashable {
    let id: Int?
    var price: Double
    var title: String
    var category: String
    var description: String
    var image: String

    init(id: Int? = nil, price: Double, title: String, category: String, description: String, image: String) {
        self.id = id
        self.price = price
        self.title = title
        self.category = category
        self.description = description
        self.image = image
    }
    
    static var emptyProduct: Product {
        Product(price: 0, title: "", category: "", description: "", image: "")
    }
}

#if DEBUG
extension Product{
    static let sampleData: [Product] =
    [
        Product(
            id: 1,
            price: 165.2,
            title: "White T-Shirt",
            category: "Clothes",
            description: "A beautiful white t-shirt.",
            image: "https://www.bclconcept.fr/uploads/media/product_catalog/0001/14/thumb_13315_product_catalog_large.png"
       ),
        Product(
            id: 2,
            price: 165.2,
            title: "White T-Shirt",
            category: "Jewels",
            description: "A beautiful white t-shirt.",
            image: "https://www.bclconcept.fr/uploads/media/product_catalog/0001/14/thumb_13315_product_catalog_large.png"
       ),
        Product(
            id: 3,
            price: 165.2,
            title: "White T-Shirt",
            category: "Clothes",
            description: "A beautiful white t-shirt.",
            image: "https://www.bclconcept.fr/uploads/media/product_catalog/0001/14/thumb_13315_product_catalog_large.png"
       ),
        Product(
            id: 4,
            price: 165.2,
            title: "White T-Shirt",
            category: "Clothes",
            description: "A beautiful white t-shirt.",
            image: "https://www.bclconcept.fr/uploads/media/product_catalog/0001/14/thumb_13315_product_catalog_large.png"
       ),
        Product(
            id: 5,
            price: 165.2,
            title: "White T-Shirt",
            category: "Clothes",
            description: "A beautiful white t-shirt.",
            image: "https://www.bclconcept.fr/uploads/media/product_catalog/0001/14/thumb_13315_product_catalog_large.png"
       ),
    ]
}
#endif
