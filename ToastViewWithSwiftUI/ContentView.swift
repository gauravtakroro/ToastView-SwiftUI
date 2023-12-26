//
//  ContentView.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var toastViewModel = ToastViewModel.shared
    @State private var advancedToastView: AdvancedToast?
    

    var body: some View {
        VStack(spacing: 20) {
            Button {
                toastViewModel.toastMessage = "Test Message with Short Duration"
                toastViewModel.duration = Toast.SHORT
                toastViewModel.showToast = true
            } label: {
                Text("Show Toast with Message With Short Duration").bold()
            }
            
            Button {
                toastViewModel.toastMessage = "Test Message with Long Duration"
                toastViewModel.duration = Toast.LONG
                toastViewModel.showToast = true
            } label: {
                Text("Show Toast with Message With Long Duration").bold()
            }
            
            Button {
                advancedToastView = AdvancedToast(type: .success, title: "Success", message: "Data saved successfully.")
            } label: {
                Text("Show Advanced Toast with Success Message").bold()
            }
            
            Button {
                advancedToastView = AdvancedToast(type: .info, title: "Info", message: "All information is fetched from Realtime Stock Market.")
            } label: {
                Text("Show Advanced Toast with Info Message").bold()
            }
            
            Button {
                advancedToastView = AdvancedToast(type: .warning, title: "Warning", message: "All information are required to fill")
            } label: {
                Text("Show Advanced Toast with Warning Message").bold()
            }
            
            Button {
                advancedToastView = AdvancedToast(type: .error, title: "Error", message: "please correct input values")
            } label: {
                Text("Show Advanced Toast with Error Message").bold()
            }
        }
        .padding().onAppear {
            toastViewModel.showToastWithString(text: "Test Message")
        }.toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: toastViewModel.duration)
        .advancedToastView(toast: $advancedToastView)

    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
