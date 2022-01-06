//
//  FillPaddingView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct FillPaddingView: View {
    let height: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.black.opacity(0.5))
            .frame(height: height)
    }
}

struct FillPaddingView_Previews: PreviewProvider {
    static var previews: some View {
        FillPaddingView(height: 50)
    }
}
