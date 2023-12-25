//
//  ToastConfig.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import Foundation
import SwiftUI

struct ToastConfig {

  let textColor: Color
  let messageFont: Font
  let backgroundColor: Color
  let duration: TimeInterval
  let transition: AnyTransition
  let animation: Animation

    init(textColor: Color = .white,
         messageFont: Font = .system(size: 14),
         backgroundColor: Color = .black.opacity(0.60),
         duration: TimeInterval = Toast.SHORT,
         transition: AnyTransition = .opacity,
         animation: Animation = .linear(duration: 0.3)) {
        
        self.textColor = textColor
        self.messageFont = messageFont
        self.backgroundColor = backgroundColor
        self.duration = duration
        self.transition = transition
        self.animation = animation
    }
}
