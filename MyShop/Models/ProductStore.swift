//
//  ProductStore.swift
//  MyShop
//
//  Created by Eliott Oblinger on 14/07/2023.
//

import Foundation
import SwiftUI
import Combine
import Factory

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var categories: [ChecklistItem] = []
    @Published var sortOptions: [ChecklistItem] = [
        ChecklistItem(name: "Name"),
        ChecklistItem(name: "Price : High to Low", isChecked: false),
        ChecklistItem(name: "Price : Low to High", isChecked: false)
    ]
    @Published var favorites: [Product] = []
    @Published var showingSortOptions: Bool = false
    @Injected(\.productsRepository) private var productsRepository
    private var cancellable: AnyCancellable?

    func loadProducts() {
        cancellable = productsRepository.loadProducts()
           .receive(on: RunLoop.main)
           .sink { error in
               if case let .failure(error) = error {
                   print(error)
               }
           } receiveValue: { (products: [Product]) in
               DispatchQueue.main.async {
                   self.products = products
                   self.categories = products.map{ ChecklistItem(name: $0.category) }.unique()
                   
                   self.setFilteredProducts()
              }
           }
    }
    
    func favoritesIndexOf(product: Product) -> Int? {
        return self.favorites.firstIndex(of: product)
    }
    
    func toggleFavorite(product: Product) -> Void {
        guard let index = favoritesIndexOf(product: product) else {
            self.favorites.append(product)
            return
        }
        
        self.favorites.remove(at: index)
    }
    
    func checkedCategories() -> [String] {
        return self
                .categories
                .filter { $0.isChecked }
                .map{ $0.name }
    }
    
    func resetCategories() -> Void {
        self.categories = self.categories.map { (category) -> ChecklistItem in
            return ChecklistItem(name: category.name)
        }
        
        setFilteredProducts()
    }
    
    func optionSelected() -> ChecklistItem {
        return self.sortOptions.first(where: {$0.isChecked})!
    }
    
    func selectSortOption(option: ChecklistItem) -> Void {
        let optionSelected = optionSelected()
        
        guard optionSelected.name != option.name else {
            return
        }
        
        self.sortOptions = self.sortOptions.map { (sortOption) -> ChecklistItem in
            return ChecklistItem(name: sortOption.name, isChecked: sortOption.name == option.name)
        }
        
        setFilteredProducts()
        
        self.showingSortOptions = false;
    }
    
    func setFilteredProducts() -> Void {
        self.filteredProducts = self.products
            .filter {
                checkedCategories().contains($0.category)
            }
            .sorted { (lhs: Product, rhs: Product) -> Bool in
                let optionSelected = optionSelected()
                
                if optionSelected.name == "Name" {
                    return lhs.title < rhs.title
                }
                
                if optionSelected.name == "Price : High to Low" {
                    return lhs.price > rhs.price
                }
                
                return lhs.price < rhs.price
            }
    }
}

extension Container {
    var productsRepository: Factory<any ProductsRepository> {
        self { RealProductsRepository() }.singleton
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
