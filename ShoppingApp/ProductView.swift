//
//  ProductView.swift
//  ShoppingApp
//
//  Created by Semanur Eserler on 14.12.2023.
//

import SwiftUI

struct ProductView: View {
    
    //@StateObject burdan kaldırdık viewmodeldan
    var vm = ProductViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(vm.products.enumerated()), id: \.element.id) { index, product in
                    NavigationLink {
                        ProductDetailsView(products: vm.products, index: index)
                    } label: {
                        ProductRowView(product: product)
                    }
                }
            }
            .navigationTitle("Products")
            .task {
                print(vm.products.count)
                await vm.fetchProducts()
            }
        }
        
    }
}

#Preview {
    ProductView()
}
