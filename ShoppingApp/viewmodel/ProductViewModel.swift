//
//  ProductViewModel.swift
//  ShoppingApp
//
//  Created by Semanur Eserler on 14.12.2023.
//

import Foundation


@Observable class ProductViewModel {
    
    // @Published vardı class yanında : observableobject vardı
    
    var products:[Product] = []
    var isEmpty:Bool = false
    private let manager = APIManager()
    
    func fetchProducts()  async {
        do {
                products = try await manager.request(url: "https://fakestoreapi.com/products")
                   print(products)
               }catch {
                   print("Fetch Product error:", error)
               }
    }
}
