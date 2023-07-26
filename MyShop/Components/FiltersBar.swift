//
//  FiltersBar.swift
//  MyShop
//
//  Created by Eliott Oblinger on 21/07/2023.
//

import SwiftUI
import SwiftUITooltip

struct FiltersBar: View {
    @EnvironmentObject var productStore: ProductStore
    @State private var showingFilters = false
    
    private func toggleFilters() -> Void {
        showingFilters.toggle()
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible())]) {
            HStack{
                Text("Sort")
                    .font(.system(size: 14))
                    .textCase(.uppercase)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .onTapGesture {
                        productStore.showingSortOptions = true
                    }
                    .popover(isPresented: $productStore.showingSortOptions,
                             attachmentAnchor: .rect(.rect(CGRect(x: 0, y:0, width: UIScreen.main.bounds.width / 2, height: 30)))){
                        SortOptions()
                    }
                Divider()
                Text("Filter")
                    .font(.system(size: 14))
                    .textCase(.uppercase)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .onTapGesture {
                        toggleFilters()
                    }
                    .sheet(isPresented: $showingFilters) {
                        FiltersSheet()
                    }
            }
        }
        .padding(12)
        .border(Color.gray.opacity(0.1))
    }
}

struct FiltersBar_Previews: PreviewProvider {
    static var previews: some View {
        FiltersBar().environmentObject(ProductStore())
    }
}
