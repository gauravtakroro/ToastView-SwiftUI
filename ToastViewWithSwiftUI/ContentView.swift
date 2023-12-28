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
    @State private var textString = ""

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button {
                    toastViewModel.toastMessage = "Test Message with Short Duration"
                    toastViewModel.duration = Toast.SHORT
                    textString = "Toast with Message With Short Duration"
                    toastViewModel.showToast = true
                } label: {
                    Text("Show Toast with Message With Short Duration").bold().underline()
                }
                
                Button {
                    toastViewModel.toastMessage = "Test Message with Long Duration"
                    toastViewModel.duration = Toast.LONG
                    textString = "Toast with Message With Long Duration"
                    toastViewModel.showToast = true
                } label: {
                    Text("Show Toast with Message With Long Duration").bold().underline()
                }
                
                Button {
                    textString = "Advanced Toast with Success Message"
                    advancedToastView = AdvancedToast(type: .success, title: "Success", message: "Data saved successfully.", onRightButtonTapped: {
                        advancedToastView = nil
                    })
                } label: {
                    Text("Show Advanced Toast with Success Message").bold().underline()
                }
                
                Button {
                    textString = "Advanced Toast with Info Message"
                    advancedToastView = AdvancedToast(type: .info, title: "Info", message: "All information is fetched from Realtime Stock Market.", onRightButtonTapped: {
                        advancedToastView = nil
                    })
                } label: {
                    Text("Show Advanced Toast with Info Message").bold().underline()
                }
                
                Button {
                    textString = "Advanced Toast with Warning Message"
                    advancedToastView = AdvancedToast(type: .warning, title: "Warning", message: "All information are required to fill", onRightButtonTapped: {
                        advancedToastView = nil
                    })
                } label: {
                    Text("Show Advanced Toast with Warning Message").bold().underline()
                }
                
                Button {
                    textString = "Advanced Toast with Error Message"
                    advancedToastView = AdvancedToast(type: .error, title: "Error", message: "please correct input values", onRightButtonTapped: {
                        advancedToastView = nil
                    })
                } label: {
                    Text("Show Advanced Toast with Error Message").bold().underline()
                }
            }.opacity((toastViewModel.showToast || advancedToastView != nil) ? 0.0 : 1.0)
            Text(textString).font(.title).foregroundColor(Color.primary).opacity((toastViewModel.showToast || advancedToastView != nil) ? 1.0 : 0.0)
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
