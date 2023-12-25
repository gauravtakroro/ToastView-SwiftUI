//
//  View+Extensions.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

extension View {
    
    func toast(message: String,
               isShowing: Binding<Bool>,
               duration: TimeInterval) -> some View {
        self.modifier(Toast(message: message,
                            isShowing: isShowing,
                            toastConfig: .init(duration: duration)))
    }
}
