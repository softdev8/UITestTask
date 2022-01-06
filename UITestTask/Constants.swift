//
//  Constants.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

final class Constants: ObservableObject {
    
    let iconSize: CGFloat = 64
    let padding: CGFloat = 10
    let largePadding: CGFloat = 40
    let borderRadius: CGFloat = 20
    let deltaScale: CGFloat = 0.05
    let shortDuration: Double = 0.05
    let duration: Double = 0.1
    
    static var shared = Constants()
}
