//
//  SortOptions.swift
//  MyShop
//
//  Created by Eliott Oblinger on 25/07/2023.
//

import SwiftUI

struct SortOptions: View {
    @EnvironmentObject var productStore: ProductStore
    
    var body: some View {
        VStack{
            ForEach(Array(zip(productStore.sortOptions.indices, productStore.sortOptions)), id: \.0) {
                index, sortOption in
                HStack{
                    VStack{
                        if sortOption.isChecked {
                            Circle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                                .padding(.leading,  UIScreen.main.bounds.width / 13)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 6)
                    Spacer()
                    VStack(){
                        Spacer()
                        HStack{
                            Text(sortOption.name)
                                .font(.system(size: 14))
                                .padding(.vertical, 10)
                            Spacer()
                        }
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                                    .frame(height: index + 1 < productStore.sortOptions.count ?
                                           1 :
                                            0)
                                    .edgesIgnoringSafeArea(.horizontal)
                    }
                }
                .onTapGesture {
                    productStore.selectSortOption(option: sortOption)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .presentationCompactAdaptation(.none)
    }
}

struct SortOptions_Previews: PreviewProvider {
    static var previews: some View {
        SortOptions().environmentObject(ProductStore())
    }
}
