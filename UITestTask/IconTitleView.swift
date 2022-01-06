//
//  IconTitleView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct IconTitleView: View {
    let imageModel: ImageModel?
    let iconSize: CGFloat
    
    var body: some View {
        VStack(spacing: 0.0) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .mask({
                        Circle(radius: iconSize / 2).fill(style: FillStyle(eoFill: true, antialiased: true))
                    })
                Image(uiImage: imageModel?.image ?? UIImage(systemName: "airplane")!)
                    .frame(maxWidth: iconSize / 2, maxHeight: iconSize / 2)
                    .opacity(imageModel?.image == nil ? 0 : 1)
            }
            .frame(height: iconSize)
            Text(imageModel?.title ?? "")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.black.opacity(0.5))

        }
    }
}

struct IconTitleView_Previews: PreviewProvider {
    static var previews: some View {
        IconTitleView(imageModel: ImageModel(image: UIImage(systemName: "airplane"), title: "Airplane Mode\nOff"), iconSize: 64)
    }
}
