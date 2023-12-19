//
//  ListingItemView.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 18.12.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = ["image1",
                  "image2",
                  "image3",
                  "image4"]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                        .foregroundStyle(.black)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                        .foregroundStyle(.black)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)
                    }
                    
                }
                
                Spacer()
                
                // rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingItemView()
    }
}
