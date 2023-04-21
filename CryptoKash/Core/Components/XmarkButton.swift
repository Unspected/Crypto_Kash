//
//  XmarkButton.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/20/23.
//

import Foundation
import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        Button {
            dismiss()
            
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }

    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
