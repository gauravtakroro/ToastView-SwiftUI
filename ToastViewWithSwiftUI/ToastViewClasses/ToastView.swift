//
//  ToastView.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import Foundation
import SwiftUI

struct Toast: ViewModifier {
 
  static let short: TimeInterval = 2

  static let long: TimeInterval = 3.5

    let message: String
    var description: String = ""
    @Binding var isShowing: Bool
    let toastConfig: ToastConfig
    
    func body(content: Content) -> some View {
        ZStack {
            content
            toastView
        }
    }

    private var toastView: some View {
        
        VStack {
            Spacer()
            if isShowing {
                Group {
                    VStack {
                        
                        Text(message)
                            .multilineTextAlignment(.center)
                            .foregroundColor(toastConfig.textColor)
                            .font(toastConfig.messageFont)
                        if !description.isEmpty {
                            Text(description)
                                .multilineTextAlignment(.center)
                                .foregroundColor(toastConfig.textColor)
                                .font(toastConfig.descriptionFont)
                        }
                    }.padding(.vertical, 16)
                        .padding(.horizontal, 30)
                }.background(Capsule().foregroundColor(toastConfig.backgroundColor))
                    .onTapGesture {
                        isShowing = false
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + toastConfig.duration) {
                            isShowing = false
                        }
                    }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 18)
        .animation(toastConfig.animation, value: isShowing)
        .transition(toastConfig.transition)
    }
}
