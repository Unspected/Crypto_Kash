//
//  OnBoarding.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/24/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var onBoardingState = 0
    @AppStorage("onBoarding") var onBoardingWasViewed: Bool = false
    private let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing),
                                                        removal: .move(edge: .leading))
    
    
    var body: some View {
        ZStack {
            ZStack {
                switch onBoardingState {
                    case 0:
                        welcomeSection
                            .transition(transition)
                    case 1:
                        secondSection
                            .transition(transition)
                    case 2:
                        thirdSection
                            .transition(transition)
                    default:
                        RoundedRectangle(cornerRadius: 25.0)
                }
            }
            
            VStack {
               
                Spacer()
                HStack {
                    ForEach(0..<3) { index in
                        if index == onBoardingState {
                            Rectangle()
                                .frame(width: 28,height: 15)
                                .cornerRadius(15)
                                .foregroundColor(Color.theme.red)
                        } else {
                            Circle()
                                .frame(height: 15)
                                .cornerRadius(15)
                                .foregroundColor(colorScheme == .dark ? Color.theme.white : Color.black.opacity(0.7))
                                .onTapGesture {
                                    onBoardingState = index
                                }
                        }
                        
                    }
                }.padding(.bottom, 30)
                bottomButton
            }
           
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.theme.background)
    }
}

extension OnBoardingView {
    
    private var bottomButton: some View {
        Text( onBoardingState == 0 ? "START" :
                onBoardingState == 2 ? "FINISH": "NEXT"
        )
            .font(.headline)
            .foregroundColor(colorScheme == .dark ? Color.theme.red : Color.theme.background)
            .frame(width: UIScreen.main.bounds.width / 2, height: 55)
            .background(colorScheme == .dark ? Color.theme.gray : Color.gray)
            .cornerRadius(25)
            .animation(nil, value: 0)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private func handleNextButtonPressed() {
        
        if onBoardingState == 2 {
            withAnimation(.spring()) {
                onBoardingWasViewed = true
            }
        } else {
            withAnimation(.spring() ) {
                onBoardingState += 1
            }
        }
        
    }
    
}

extension OnBoardingView {
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(height: 300)
                Text("Be the first to know about price changes in the cryptocurrency market")
                .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                Spacer()
              
            }
            .multilineTextAlignment(.center)
            .padding(50)
           // .border(Color.white, width: 1)
    }
    
    private var secondSection: some View {
        VStack(spacing: 40) {
                Image("secondPage")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(height: 300)
                Text("The application uses and displays the most up-to-date information at the moment")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                Spacer()
                  
            }
            .multilineTextAlignment(.center)
            .padding(50)
          //  .border(Color.white, width: 1)
            
    }
    
    private var thirdSection: some View {
        VStack(spacing: 40) {
                Image("thirdPage")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(height: 300)
                Text("Create your portfolio and keep track of what is interesting only to you")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                  Spacer()
            }
            .multilineTextAlignment(.center)
            .padding(50)
           // .border(Color.white, width: 1)
           
    }
}

