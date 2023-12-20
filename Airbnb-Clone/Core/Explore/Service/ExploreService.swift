//
//  ExploreService.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 20.12.2023.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
