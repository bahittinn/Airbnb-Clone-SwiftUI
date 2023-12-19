//
//  DestinationSearchView.swift
//  Airbnb-Clone
//
//  Created by Bahittin on 19.12.2023.
//

import SwiftUI

enum DestinationSearchOptions {
    case location, dates, guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate   = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.easeIn) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            // search view
            Group {
                VStack(alignment: .leading) {
                    if selectedOption == .location {
                        Text("Where to?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                            
                            TextField("Search destinations", text: $destination)
                                .font(.subheadline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    } else {
                        CollapsedPickerView(title: "Where", description: "Add destination")
                    }
                    
                }
                .padding()
                .frame(height: selectedOption == .location ? 120 : 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.linear) { selectedOption = .location }
                }
            }
            
            Group {
                // date selection view
                VStack(alignment: .leading) {
                    if selectedOption == .dates {
                         Text("When's your trip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        VStack {
                            DatePicker("From", selection: $startDate, displayedComponents: .date)
                            
                            Divider()
                            
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        }
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        
                    } else {
                        CollapsedPickerView(title: "When", description: "Add dates")
                    }
                }
                .padding()
                .frame(height: selectedOption == .dates ? 180 : 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.linear) { selectedOption = .dates }
                }
            }
            
            Group {
                VStack(alignment: .leading) {
                    if selectedOption == .guests {
                        Text("Who's coming")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Stepper {
                            Text("\(numGuests) Adults")
                        } onIncrement: {
                            numGuests += 1
                        } onDecrement: {
                            guard numGuests > 0 else { return }
                            numGuests -= 1
                        }

                    } else {
                        CollapsedPickerView(title: "Who", description: "Add guests")
                    }
                }
                .padding()
                .frame(height: selectedOption == .guests ? 120 : 64)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .shadow(radius: 10)
                .onTapGesture {
                    withAnimation(.linear) { selectedOption = .guests }
                }
            }
        }
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(show: .constant(false))
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text(title)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Text(description)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
            }
        }
    }
}
