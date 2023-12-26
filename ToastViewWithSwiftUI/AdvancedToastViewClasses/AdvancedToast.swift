//
//  AdvancedToast.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

struct AdvancedToast: Equatable {
    static func == (lhs: AdvancedToast, rhs: AdvancedToast) -> Bool {
        return lhs.title == rhs.title && lhs.message == rhs.message && lhs.type == rhs.type
    }
    
    var type: AdvancedToastStyle
    var title: String
    var message: String
    var duration: Double = .greatestFiniteMagnitude
    var buttonTitle: String = "Dismiss"
    var onRightButtonTapped: (() -> Void)?
}
