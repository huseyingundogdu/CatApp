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
                .strokeBorder(Color.primary, lineWidth: 0)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.blue)
                )
                .frame(height: 350)
                .blur(radius: 10)
                .shadow(radius: 10)
            
            ProgressView()
                .controlSize(.large)
                .frame(height: 350)
        }
    }
}

#Preview {
    CustomProgressView()
}
