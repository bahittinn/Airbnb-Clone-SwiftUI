//
//  WishListView.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 20.12.2023.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlist")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlist once you've logged in")
                        .font(.footnote)
                }
                .padding()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Log in")
                        .frame(width: 360, height: 48)
                        .modifier(CustomButton())
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
