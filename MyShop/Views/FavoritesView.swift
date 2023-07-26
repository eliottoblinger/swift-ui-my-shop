//
//  FavoritesView.swift
//  MyShop
//
//  Created by Eliott Oblinger on 21/07/2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var productStore: ProductStore
    
    private func removeFromFavorites(at offsets: IndexSet) -> Void {
        productStore.favorites.remove(atOffsets: offsets)
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            List {
                ForEach($productStore.favorites, id: \.id) { $product in
                    FavoriteItem(product: $product)
                }
                .onDelete(perform: removeFromFavorites)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(ProductStore())
    }
}
