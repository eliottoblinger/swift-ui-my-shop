//
//  ProductRow.swift
//  MyShop
//
//  Created by Eliott Oblinger on 16/07/2023.
//

import SwiftUI
import Kingfisher

struct ProductItem: View {
    @EnvironmentObject var productStore: ProductStore
    @Binding var product: Product
    
    private func toggleFavorite() -> Void {
        productStore.toggleFavorite(product: product)
    }
    
    private func favoriteIconColor() -> Color {
        guard productStore.favoritesIndexOf(product: product) != nil else {
            return Color.black
        }
        
        return Color.red
    }
    
    private func favoriteIcon() -> String {
        guard productStore.favoritesIndexOf(product: product) != nil else {
            return "heart"
        }
        
        return "heart.fill"
    }
    
    var body: some View {
        VStack {
            KFImage
                .url(URL(string: product.image))
                .placeholder {
                    Color.gray
                        .aspectRatio(contentMode: .fit)
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.width / 2)
                .padding(.bottom, 4)
            
            VStack{
                HStack() {
                    Text(product.price.formatted(.currency(code: "USD")))
                        .bold()
                    Spacer()
                    Button(action: toggleFavorite){
                        Image(systemName: favoriteIcon())
                            .font(.system(size: 20))
                            .foregroundColor(favoriteIconColor())
                    }
                }
                .padding(.bottom, 2)
                .padding(.trailing, 4)
                Text("\(product.title) - \(product.description)")
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: .constant(Product.sampleData[0]))
            .environmentObject(ProductStore())
    }
}
