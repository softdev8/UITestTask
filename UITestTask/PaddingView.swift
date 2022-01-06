//
//  PaddingView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct PaddingView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.black.opacity(0.5))
            .frame(width: width, height: height)
    }
}

struct PaddingView_Previews: PreviewProvider {
    static var previews: some View {
        PaddingView(width: 100, height: 50)
    }
}
