//
//  ExploreViewModel.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 20.12.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    
    init() {
        
    }
    
    func fetchListings() async {
        
    }
}
