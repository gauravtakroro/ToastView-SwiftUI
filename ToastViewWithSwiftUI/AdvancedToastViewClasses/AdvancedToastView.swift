//
//  AdvancedToastView.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

struct AdvancedToastView: View {
    var type: AdvancedToastStyle
    var title: String
    var message: String
    var buttonTitle: String = "Dismiss"
    var onRightButtonTapped: (() -> Void)
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: type.iconFileName)
                    .foregroundColor(type.themeColor)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 14))
                        .foregroundColor(Color.primary)
                    
                    Text(message)
                        .font(.system(size: 12))
                        .foregroundColor(Color.primary)
                }
                
                Spacer(minLength: 10)
                Divider().frame(height: 56, alignment: Alignment.center).padding(.vertical, -8)
                Spacer(minLength: 10)
                Button {
                    onRightButtonTapped()
                } label: {
                    Text(buttonTitle)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                }
            }.padding(16)
        }
        .background(Color.white)
        .overlay(
            Rectangle()
                .fill(type.themeColor)
                .frame(width: 6)
                .clipped(), alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 25)
    }
}
