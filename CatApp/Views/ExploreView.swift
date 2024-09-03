//
//  ExploreView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button(action: {
                    //TODO: get new image and fact
                }, label: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 350)
                })
                    
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //TODO: Like
                    }, label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    })
                    
                    Button(action: {
                        //TODO: Info
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                    })
                }
                .frame(maxWidth: .infinity)
                
                
                Text(fact1.data[0])
                    .multilineTextAlignment(.center)
                    .italic()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
