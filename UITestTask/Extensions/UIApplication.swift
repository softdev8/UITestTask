//
//  UIApplication.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

extension UIApplication {
    var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
