//
//  ListingImageCarouselView.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 19.12.2023.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var images = ["image1",
                  "image2",
                  "image3",
                  "image4"]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        } 
        .tabViewStyle(.page)
    }
}

struct ListingImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageCarouselView()
    }
}
