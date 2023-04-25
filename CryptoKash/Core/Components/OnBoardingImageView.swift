//
//  OnBoardingImageView.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/24/23.
//

import SwiftUI

struct OnBoardingImageView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let imageName: String
    let additonalText: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 500)
                .foregroundColor(.white)
                .padding(.bottom, -20)
            Text(additonalText)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                .frame(maxWidth: .infinity)
            Spacer()
            
            
        }
        .multilineTextAlignment(.center)
        .padding(1)
    }
}

struct OnBoardingImageView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingImageView(imageName: "firstPage", additonalText: "Text here")
            .background(Color.theme.background)
    }
}
