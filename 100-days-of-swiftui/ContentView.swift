//
//  ContentView.swift
//  100-days-of-swiftui
//
//  Created by Ahmad Yasser on 26/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var configureIsTapped = false
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {

            VStack {
                if viewModel.buttonIsHidden {
                    TapCounterButton().hidden()
                } else {
                    TapCounterButton()
                }
                Button {
                    configureIsTapped = true
                    viewModel.configureRemoteConfig()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 40)
                            .cornerRadius(8)
                            .foregroundColor(configureIsTapped ? .gray : .black)
                        Text("Initialize Remote Config")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }.disabled(configureIsTapped)
            }
            .navigationTitle("Some view")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TapCounterButton: View {
    @State var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        .foregroundColor(.black)
        .buttonStyle(.bordered)
    }
}
