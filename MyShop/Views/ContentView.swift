//
//  ContentView.swift
//  MyShop
//
//  Created by Eliott Oblinger on 14/07/2023.
//

import SwiftUI
import Factory

struct ContentView: View {
    @StateObject var productStore: ProductStore = ProductStore()
    
    init(){
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor(Color.white)
        
        UITabBar.appearance().standardAppearance = appearance
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            VStack{
                if productStore.products.isEmpty{
                    Text("MyShop")
                        .font(.system(size: 32))
                        .bold()
                }
                else {
                    ScrollView {
                        TabView {
                            NavigationView{
                                ProductsView()
                            }
                            .tabItem {
                                Image(systemName: "list.bullet")
                            }
                            NavigationView{
                                FavoritesView()
                            }
                            .badge(productStore.favorites.count)
                            .tabItem {
                                Image(systemName: "heart")
                            }
                        }
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height
                        )
                        .accentColor(Color.black)
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
            .onAppear {
                productStore.loadProducts()
            }
            .environmentObject(productStore)
            
            if productStore.showingSortOptions{
                Color.black.opacity(0.3)
                     .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let _ = Container.shared.productsRepository.register { MockProductsRepository()
        }
        
        ContentView()
    }
}
