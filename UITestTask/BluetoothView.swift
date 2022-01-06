//
//  BluetoothView.swift
//  UITestTask
//
//  Created by Alex Han on 1/5/22.
//

import SwiftUI

struct BluetoothView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @State private var scale: CGFloat = 0.9
    
    let modalActionListener: ((Int) -> Void)?
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation(.linear(duration: Constants.shared.duration)) {
                    self.scale = 0.9
                }
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Constants.shared.duration) {
                    self.viewControllerHolder?.dismiss(animated: false, completion: {
                        self.modalActionListener?(1)
                    })
                }
            }) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .foregroundColor(.clear)
            
            VStack {
                VStack(spacing: 0.0) {
                    Image(systemName: "airplane")
                        .foregroundColor(Color.white)
                        .padding()
                    Text("Bluetooth")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                    List {
                        ForEach(0..<10) { i in
                            Text("Bluetooth \(i)")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .listRowBackground(Color.black.opacity(0.5))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: 300)
                    Text("Bluetooth Settings...")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .padding()
                }
                .background(Color.black.opacity(0.5))
                .onAppear() {
                    withAnimation(.linear(duration: Constants.shared.duration)) {
                        self.scale = 1
                    }
                }
            }
            .cornerRadius(Constants.shared.borderRadius)
            .padding()
            .scaleEffect(self.scale)
        }
    }
}

struct BluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothView(modalActionListener: nil)
    }
}
