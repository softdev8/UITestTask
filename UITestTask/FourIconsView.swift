//
//  IconsView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct FourIconsView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    var modalActionListener: ((Bool) -> Void)? = nil
    
    @State private var boxFrame: CGRect = .zero
    @State private var isShowingSixIconsView: Bool = false
    @State private var isShowingBluetoothView: Bool = false
    @State private var scale: CGFloat = 1
    
    let data: [ImageModel]
    
    var body: some View {
        VStack(spacing: 0.0) {
            PaddingView(width: Constants.shared.iconSize * 2 + Constants.shared.padding * 3, height: Constants.shared.padding)
            HStack(spacing: 0.0) {
                PaddingView(width: Constants.shared.padding, height: Constants.shared.iconSize)
                IconView(image: self.data.count < 1 ? nil : self.data[0].image, iconSize: Constants.shared.iconSize)
                PaddingView(width: Constants.shared.padding, height: Constants.shared.iconSize)
                IconView(image: self.data.count < 2 ? nil : self.data[1].image, iconSize: Constants.shared.iconSize)
                PaddingView(width: Constants.shared.padding, height: Constants.shared.iconSize)
            }
            PaddingView(width: Constants.shared.iconSize * 2 + Constants.shared.padding * 3, height: Constants.shared.padding)
            HStack(spacing: 0.0) {
                PaddingView(width: Constants.shared.padding, height: Constants.shared.iconSize)
                IconView(image: self.data.count < 3 ? nil : self.data[2].image, iconSize: Constants.shared.iconSize)
                PaddingView(width: Constants.shared.padding, height: Constants.shared.iconSize)
                IconView(image: self.data.count < 4 ? nil : self.data[3].image, iconSize: Constants.shared.iconSize)
                PaddingView(width: Constants.shared.padding, height: Constants.shared.iconSize)
            }
            PaddingView(width: Constants.shared.iconSize * 2 + Constants.shared.padding * 3, height: Constants.shared.padding)
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: FramePreferenceKey.self, value: geo.frame(in: .global))
            }
        )
        .cornerRadius(Constants.shared.borderRadius)
        .scaleEffect(self.scale)
        .opacity(self.isShowingSixIconsView ? 0 : 1)
        .onLongPressGesture {
            withAnimation(.linear(duration: Constants.shared.shortDuration)) {
                self.scale -= Constants.shared.deltaScale
            }
            withAnimation(.linear(duration: Constants.shared.shortDuration).delay(Constants.shared.shortDuration)) {
                self.scale += Constants.shared.deltaScale
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.shared.shortDuration * 2) {
                self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                    SixIconsView(
                        isShowingSixIconsView: $isShowingSixIconsView,
                        isShowingBluetoothView: $isShowingBluetoothView,
                        initFrame: self.boxFrame,
                        data: self.data,
                        modalActionListener: modalActionHandler(actionType:)
                    )
                }
                self.isShowingSixIconsView = true
                self.modalActionListener?(true)
            }
        }
        .onPreferenceChange(FramePreferenceKey.self) { preferences in
            if self.boxFrame.isEmpty {
                self.boxFrame = preferences
            }
        }
    }
    
    private func modalActionHandler(actionType: Int) {
        switch actionType {
        case 1:
            self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                SixIconsView(
                    isShowingSixIconsView: $isShowingSixIconsView,
                    isShowingBluetoothView: $isShowingBluetoothView,
                    initFrame: self.boxFrame,
                    data: self.data,
                    modalActionListener: modalActionHandler(actionType:)
                )
            }
            break
        case 2:
            viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                BluetoothView(modalActionListener: modalActionHandler(actionType:))
            }
            self.isShowingBluetoothView = true
            break
        default:
            self.modalActionListener?(false)
        }
    }
}

extension FourIconsView {
    
    func onModalAction(modalActionListener: @escaping (Bool) -> Void) -> Self {
        var copy = self
        copy.modalActionListener = modalActionListener
        return copy
    }
}

private struct FramePreferenceKey: PreferenceKey {
    typealias Value = CGRect
    static var defaultValue: Value = .zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FourIconsView(data: [
                ImageModel(image: UIImage(systemName: "airplane"), title: "Airplane Mode\nOff"),
                ImageModel(image: UIImage(systemName: "airplane"), title: "Celluar Data\nOff"),
                ImageModel(image: UIImage(systemName: "wifi"), title: "WLAN\n888"),
                ImageModel(image: UIImage(systemName: "wifi"), title: "Bluetooth\nOn"),
                ImageModel(image: UIImage(systemName: "airplane"), title: "AirDrop\nContracts Only"),
                ImageModel(image: UIImage(systemName: "airplane"), title: "Personal Hotspot\nOff")
            ])
        }
    }
}
