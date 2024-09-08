//
//  CustomProgressView.swift
//  CatApp
//
//  Created by Huseyin on 06/09/2024.
//

import SwiftUI

struct CustomProgressView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.white)
                //.frame(height: 350)
                .shadow(radius: 10)
            
            ProgressView()
                .controlSize(.large)
                //.frame(height: 350)
        }
    }
}

#Preview {
    CustomProgressView()
}
