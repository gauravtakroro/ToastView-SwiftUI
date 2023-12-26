//
//  AdvancedToastModifiers.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

struct AdvancedToastModifiers: ViewModifier {
    @Binding var toast: AdvancedToast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: -30)
                }.animation(.spring(), value: toast)
            )
            .onChange(of: toast) { _ in
                showAdvancedToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                Spacer()
                AdvancedToastView(
                    type: toast.type,
                    title: toast.title,
                    message: toast.message,
                    buttonTitle: toast.buttonTitle) {
                        dismissToast()
                        if let onRightButtonTapped = toast.onRightButtonTapped {
                            onRightButtonTapped()
                        }
                    }
            }
            .transition(.move(edge: .bottom))
        }
    }
    
    private func showAdvancedToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
               dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}
