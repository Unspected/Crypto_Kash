//
//  LaunchView.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/20/23.
//

import Foundation
import SwiftUI

struct LaunchView: View {
   
  //  @State private var loadingText: [String] =  ["C","r","y","p","t","o"," ","K","a","s","h"]
    @State private var loadingText: [String] = "Crypto Kash".map { String( $0) }
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 200, height: 200)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing:0 ) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.launch.accent)
                                .offset(y: counter == index ? -10: 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                    
                }
            }
            .offset(y: 150)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                    
                } else {
                    counter += 1
                }
                
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
