//
//  FavoriteItem.swift
//  MyShop
//
//  Created by Eliott Oblinger on 21/07/2023.
//

import SwiftUI
import Kingfisher

struct FavoriteItem: View {
    @EnvironmentObject var productStore: ProductStore
    @Binding var product: Product
    
    var body: some View {
        VStack {
            HStack(alignment: .top){
                KFImage
                    .url(URL(string: product.image))
                    .placeholder {
                        Color.gray
                            .aspectRatio(contentMode: .fit)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading){
                    Text(product.price.formatted(.currency(code: "USD")))
                        .bold()
                        .padding(.bottom, 2)
                    Text("\(product.title) - \(product.description)")
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.secondary)
                }
            }
            .padding(.bottom, 8)
            .padding(.top, 8)
        }
        .background(Color.white)
    }
}

struct FavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteItem(product: .constant(Product.sampleData[0]))
            .environmentObject(ProductStore())
    }
}
