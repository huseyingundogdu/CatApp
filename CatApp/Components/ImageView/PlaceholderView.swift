//
//  PlaceholderView.swift
//  CatApp
//
//  Created by Huseyin on 08/09/2024.
//

import SwiftUI

struct PlaceholderView: View {
    
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: width, height: height)
            Text("🐈")
                .font(.system(size: min(width, height) / 2))
        }
    }
}

#Preview {
    PlaceholderView(width: 100, height: 100)
}
