//
//  ToastViewModel.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import Foundation

class ToastViewModel: ObservableObject {

    static let shared = ToastViewModel()
    
    @Published var showToast = false
    @Published var toastMessage = ""
    @Published var duration: TimeInterval = Toast.SHORT

    func showToastWithString(text: String) {
        self.toastMessage = text
    }
}
