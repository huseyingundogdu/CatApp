//
//  LikedView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct LikedView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let items = 1...50
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        // Each item in the grid
                        Button(action: {}, label: {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(maxWidth: .infinity)
                                .frame(height: 120)
                        })
                    }
                }
                .padding(.all, 10)
                .frame(width: .infinity, height: .infinity)
            }
            .navigationTitle("Liked")
        }
    }
}

#Preview {
    LikedView()
}
