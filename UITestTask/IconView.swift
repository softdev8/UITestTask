//
//  IconView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct IconView: View {
    let image: UIImage?
    let iconSize: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.5))
                .mask({
                    Circle(radius: iconSize / 2).fill(style: FillStyle(eoFill: true, antialiased: true))
                })
            Image(uiImage: image ?? UIImage(systemName: "airplane")!)
                .frame(maxWidth: iconSize / 2, maxHeight: iconSize / 2)
                .opacity(image == nil ? 0 : 1)
        }
        .frame(width: iconSize, height: iconSize)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(image: UIImage(systemName: "airplane"), iconSize: 64)
    }
}
