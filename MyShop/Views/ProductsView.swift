//
//  ProductsList.swift
//  MyShop
//
//  Created by Eliott Oblinger on 16/07/2023.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var productStore: ProductStore
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                FiltersBar()
                ScrollView {
                    Text("\(productStore.filteredProducts.count) product\(productStore.filteredProducts.count > 1 ? "s" : "") found")
                        .font(.system(size: 12))
                        .padding(12)
                        .foregroundColor(Color.secondary)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 32) {
                        ForEach($productStore.filteredProducts, id: \.id) {
                            $product in
                            ProductItem(product: $product)
                        }
                    }
                    .padding()
                }
                .padding(.top, -2)
            }
        }
        .navigationTitle("Products")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView().environmentObject(ProductStore())
    }
}
