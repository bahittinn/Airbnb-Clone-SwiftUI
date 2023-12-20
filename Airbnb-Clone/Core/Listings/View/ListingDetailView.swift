//
//  ListingDetailView.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 19.12.2023.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            Group {
                ZStack(alignment: .topLeading) {
                    ListingImageCarouselView(listing: listing)
                        .frame(height: 320)
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 32, height: 32)
                            }
                            .padding(50)
                    }
                }
            }
            Group {
                VStack(alignment: .leading, spacing: 8) {
                    Text(listing.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                            Text("\(listing.rating)")
                            
                            Text(" - ")
                            
                            Text("28 reviews")
                                .underline()
                                .fontWeight(.semibold)
                        }
                        .font(.caption)
                        .foregroundStyle(.black)
                        
                        Text("\(listing.city), \(listing.state)")
                    }
                    .font(.caption)
                }
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
            }
            Group {
                // host info view
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                            .font(.headline)
                            .frame(width: 250, alignment: .leading)
                        
                        HStack(spacing: 2) {
                            Text("\(listing.numberofGuests) guests -")
                            Text("\(listing.numberOfBedrooms) bedrooms -")
                            Text("\(listing.numberOfBeds) beds -")
                            Text("\(listing.numberOfBathrooms) baths")
                        }
                        .font(.caption)
                    }
                    .frame(width: 300, alignment: .leading)
                    
                    Spacer()
                    
                    Image("\(listing.ownerImageUrl)")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .scaledToFill()
                        .clipShape(Circle())
                }
                .padding()
                
                Divider()
            }
            Group {
                // listing features
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(listing.features) { feature in
                        HStack(spacing: 12) {
                            Image(systemName: feature.imageName)
                            
                            VStack(alignment: .leading) {
                                Text(feature.title)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                
                                Text(feature.subTitle)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Divider()
            }
            Group {
                // bedrooms view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                                VStack(alignment: .leading, spacing: 10) {
                                    Image(systemName: "bed.double")
                                    Text("Bedroom \(bedroom)")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 132, height: 100)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(Color(.gray))
                                }
                            }
                        }
                    }
                }
                .padding()
                
                Divider()
            }
            Group {
                // listing ameneties
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(listing.ameneties) { amenity in
                        HStack {
                            Image(systemName: amenity.imageName)
                                .frame(width: 32)
                            
                            Text(amenity.title)
                                .font(.footnote)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Divider()
            }
            Group {
                // map view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll be")
                        .font(.headline)
                    
                    Map(
                        coordinateRegion: $region,
                        interactionModes: MapInteractionModes.all,
                        showsUserLocation: true,
                        userTrackingMode: $userTrackingMode
                    )
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView(listing: DeveloperPreview.shared.listings[0])
    }
}
