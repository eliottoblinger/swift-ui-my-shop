//
//  FiltersSheet.swift
//  MyShop
//
//  Created by Eliott Oblinger on 21/07/2023.
//

import SwiftUI

struct FiltersSheet: View {
    @EnvironmentObject var productStore: ProductStore
    @State var showingCategoriesFilters: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    private func toggleCategoriesFilters() -> Void {
        showingCategoriesFilters.toggle()
    }
    
    private func dismissSheet() -> Void {
        productStore.setFilteredProducts()
        presentationMode.wrappedValue.dismiss()
    }
    
    private func categoriesChecked() -> String {
        let categoriesChecked = productStore.categories.filter { $0.isChecked }
        
        if productStore.categories.count == categoriesChecked.count {
            return "All"
        }
        
        return categoriesChecked
            .map { $0.name.capitalized }
            .joined(separator:  ", ")
    }
    
    var body: some View {
        ZStack(alignment: .center){
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    HStack(){
                        Text("Categories")
                        Spacer()
                        Text(categoriesChecked())
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(Color.secondary)
                    }
                    .padding()
                    .background(Color.white)
                    .onTapGesture {
                        toggleCategoriesFilters()
                    }
                    .sheet(isPresented: $showingCategoriesFilters){
                        CategoriesFilters()
                            .interactiveDismissDisabled()
                    }
                    .padding(.top, 48)
                    Spacer()
                    Button(action: dismissSheet){
                        Text("Show products")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(DefaultButton())
                    .padding(8)
                }
            }
        }
    }
}

struct FiltersSheet_Previews: PreviewProvider {
    static var previews: some View {
        FiltersSheet().environmentObject(ProductStore())
    }
}

struct DefaultButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.uppercase)
            .font(.system(size: 14))
            .bold()
            .padding()
            .background(.black)
            .foregroundStyle(.white)
    }
}
