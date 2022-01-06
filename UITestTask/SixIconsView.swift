//
//  SixIconsView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct SixIconsView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @Binding var isShowingSixIconsView: Bool
    @Binding var isShowingBluetoothView: Bool
    @State private var didAppear = false
    @State private var boxFrame: CGRect = .zero
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var width: CGFloat = .infinity
    @State private var height: CGFloat = .infinity
    @State private var scale: CGFloat = 1
    
    let initFrame: CGRect
    let data: [ImageModel]
    let modalActionListener: ((Int) -> Void)?
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation(.linear(duration: Constants.shared.duration)) {
                    self.offsetX = self.initFrame.midX - self.boxFrame.midX
                    self.offsetY = self.initFrame.midY - self.boxFrame.midY
                    self.width = self.initFrame.width
                    self.height = self.initFrame.height
                }
                
                self.modalActionListener?(0)
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.shared.duration) {
                    self.viewControllerHolder?.dismiss(animated: false, completion: nil)
                    self.isShowingSixIconsView = false
                }
            }) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .foregroundColor(.clear)
            
            VStack {
                VStack(spacing: 0.0) {
                    FillPaddingView(height: Constants.shared.largePadding)
                    HStack(spacing: 0.0) {
                        IconTitleView(imageModel: self.data.count < 1 ? nil : self.data[0], iconSize: Constants.shared.iconSize)
                        IconTitleView(imageModel: self.data.count < 2 ? nil : self.data[1], iconSize: Constants.shared.iconSize)
                    }
                    FillPaddingView(height: Constants.shared.largePadding)
                    HStack(spacing: 0.0) {
                        IconTitleView(imageModel: self.data.count < 3 ? nil : self.data[2], iconSize: Constants.shared.iconSize)
                        IconTitleView(imageModel: self.data.count < 4 ? nil : self.data[3], iconSize: Constants.shared.iconSize)
                            .onLongPressGesture {
                                withAnimation(.linear(duration: Constants.shared.duration)) {
                                    self.scale = 0.9
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.shared.duration) {
                                    self.viewControllerHolder?.dismiss(animated: false, completion: {
                                        self.modalActionListener?(2)
                                    })
                                }
                            }
                    }
                    FillPaddingView(height: Constants.shared.largePadding)
                    HStack(spacing: 0.0) {
                        IconTitleView(imageModel: self.data.count < 5 ? nil : self.data[4], iconSize: Constants.shared.iconSize)
                        IconTitleView(imageModel: self.data.count < 6 ? nil : self.data[5], iconSize: Constants.shared.iconSize)
                    }
                    FillPaddingView(height: Constants.shared.largePadding)
                }
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: FramePreferenceKey.self, value: geo.frame(in: .global))
                    }
                )
                .onAppear() {
                    if self.didAppear {
                        return
                    }
                    self.didAppear = true
                    
                    if self.isShowingBluetoothView {
                        self.isShowingBluetoothView = false
                        self.width = self.boxFrame.width
                        self.height = self.boxFrame.height
                        self.scale = 0.9
                        
                        withAnimation(.linear(duration: Constants.shared.duration)) {
                            self.scale = 1
                        }
                    } else {
                        self.offsetX = self.initFrame.midX - self.boxFrame.midX
                        self.offsetY = self.initFrame.midY - self.boxFrame.midY
                        self.width = self.initFrame.width
                        self.height = self.initFrame.height

                        withAnimation(.linear(duration: Constants.shared.duration)) {
                            self.offsetX = 0
                            self.offsetY = 0
                            self.width = self.boxFrame.width
                            self.height = self.boxFrame.height
                        }
                    }
                }
                .onPreferenceChange(FramePreferenceKey.self) { preference in
                    if self.boxFrame.isEmpty {
                        self.boxFrame = preference
                    }
                }
            }
            .modifier(CustomFrameModifier(width: self.width, height: self.height, alignment: .top))
            .clipped()
            .cornerRadius(Constants.shared.borderRadius)
            .padding()
            .offset(x: self.offsetX, y: self.offsetY)
            .scaleEffect(self.scale)
        }
    }
}

private struct FramePreferenceKey: PreferenceKey {
    typealias Value = CGRect
    static var defaultValue: Value = .zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

private struct CustomFrameModifier: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment
    
    @ViewBuilder func body(content: Content) -> some View {
        if height.isInfinite {
            content.frame(maxWidth: width, alignment: alignment)
        } else {
            content.frame(maxWidth: width, maxHeight: height, alignment: alignment)
        }
    }
}

struct SixIconsView_Previews: PreviewProvider {
    static var previews: some View {
        SixIconsView(
            isShowingSixIconsView: .constant(true),
            isShowingBluetoothView: .constant(false),
            initFrame: CGRect(),
            data: [
                ImageModel(image: UIImage(systemName: "airplane"), title: "Airplane Mode\nOff"),
                ImageModel(image: UIImage(systemName: "airplane"), title: "Celluar Data\nOff"),
                ImageModel(image: UIImage(systemName: "wifi"), title: "WLAN\n888"),
                ImageModel(image: UIImage(systemName: "wifi"), title: "Bluetooth\nOn"),
                ImageModel(image: UIImage(systemName: "airplane"), title: "AirDrop\nContracts Only"),
                ImageModel(image: UIImage(systemName: "airplane"), title: "Personal Hotspot\nOff")
            ],
            modalActionListener: nil
        )
    }
}
