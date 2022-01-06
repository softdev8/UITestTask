//
//  ContentView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingModal = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.4))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    FourIconsView(data: [
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Airplane Mode\nOff"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Celluar Data\nOff"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "WLAN\n888"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Bluetooth\nOn"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "AirDrop\nContracts Only"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Personal Hotspot\nOff")
                    ])
                        .onModalAction { isShowing in
                            withAnimation(.linear(duration: Constants.shared.duration)) {
                                self.isShowingModal = isShowing
                            }
                        }
                        .opacity(self.isShowingModal ? 0 : 1)
                    FourIconsView(data: [
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Airplane Mode\nOff"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Celluar Data\nOff"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "WLAN\n888"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Bluetooth\nOn"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "AirDrop\nContracts Only"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Personal Hotspot\nOff")
                    ])
                        .onModalAction { isShowing in
                            withAnimation(.linear(duration: Constants.shared.duration)) {
                                self.isShowingModal = isShowing
                            }
                        }
                        .opacity(self.isShowingModal ? 0 : 1)
                }
                HStack {
                    FourIconsView(data: [
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Airplane Mode\nOff"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Celluar Data\nOff"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "WLAN\n888"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Bluetooth\nOn"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "AirDrop\nContracts Only"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Personal Hotspot\nOff")
                    ])
                        .onModalAction { isShowing in
                            withAnimation(.linear(duration: Constants.shared.duration)) {
                                self.isShowingModal = isShowing
                            }
                        }
                        .opacity(self.isShowingModal ? 0 : 1)
                    FourIconsView(data: [
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Airplane Mode\nOff"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Celluar Data\nOff"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "WLAN\n888"),
                        ImageModel(image: UIImage(systemName: "airplane"), title: "Bluetooth\nOn"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "AirDrop\nContracts Only"),
                        ImageModel(image: UIImage(systemName: "wifi"), title: "Personal Hotspot\nOff")
                    ])
                        .onModalAction { isShowing in
                            withAnimation(.linear(duration: Constants.shared.duration)) {
                                self.isShowingModal = isShowing
                            }
                        }
                        .opacity(self.isShowingModal ? 0 : 1)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
