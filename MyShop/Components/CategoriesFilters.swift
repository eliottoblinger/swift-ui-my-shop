//
//  CategoryFilter.swift
//  MyShop
//
//  Created by Eliott Oblinger on 21/07/2023.
//

import SwiftUI

struct CategoriesFilters: View {
    @EnvironmentObject var productStore: ProductStore
    @Environment(\.presentationMode) var presentationMode
    
    private func dismissSheet() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        ZStack(){
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack{
                List {
                    ForEach($productStore.categories, id: \.self) { $category in
                        Toggle(category.name.capitalized, isOn: $category.isChecked)
                            .toggleStyle(CheckboxStyle())
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 48)
                if (productStore.categories.filter { !$0.isChecked }.count != 0) {
                    Button(action: productStore.resetCategories){
                        Text("Reset categories")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .underline()
                    }
                }
                Button(action: dismissSheet){
                    HStack{
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20))
                        Text("Go back")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                .buttonStyle(DefaultButton())
                .padding(8)
            }
        }
    }
}

struct CategoriesFilters_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesFilters().environmentObject(ProductStore())
    }
}

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .black : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
