//
//  AdvancedToastStyle.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

enum AdvancedToastStyle {
    case error
    case warning
    case success
    case info
}

extension AdvancedToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.yellow
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}
