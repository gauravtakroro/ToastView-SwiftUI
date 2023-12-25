//
//  ContentView.swift
//  ToastViewWithSwiftUI
//
//  Created by Gaurav Tak on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var toastViewModel = ToastViewModel.shared

    var body: some View {
        VStack {
            Button {
                toastViewModel.toastMessage = "Test Message-1"
                toastViewModel.duration = Toast.SHORT
                toastViewModel.showToast = true
            } label: {
                Text("Show Toast with Message With Short Duration")
            }.padding(.bottom, 20)
            
            Button {
                toastViewModel.toastMessage = "Test Message-2"
                toastViewModel.duration = Toast.LONG
                toastViewModel.showToast = true
            } label: {
                Text("Show Toast with Message With Long Duration")
            }
        }
        .padding().onAppear {
            toastViewModel.showToastWithString(text: "Test Message")
        }.toast(message: toastViewModel.toastMessage, isShowing: $toastViewModel.showToast, duration: toastViewModel.duration)

    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
