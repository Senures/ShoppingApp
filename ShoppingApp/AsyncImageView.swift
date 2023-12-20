//
//  AsyncImageView.swift
//  ShoppingApp
//
//  Created by Semanur Eserler on 15.12.2023.
//

import SwiftUI

struct AsyncImageView: View {

    let imageURL: String?

    var body: some View {
        if let imageURL, let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
        }else {
            ProgressView()
        }
    }
}
