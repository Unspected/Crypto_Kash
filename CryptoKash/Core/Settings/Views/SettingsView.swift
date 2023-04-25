//
//  SettingsView.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/20/23.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coinGecko = URL(string: "https://www.coingecko.com/")!
    let github = URL(string: "https://www.github.com/unspected")!
    let linkedin = URL(string: "https://www.linkedin.com/in/pavel-andreev1/")!
    
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                //background
                Color.theme.background
                // content
                List {
                    aboutMeSection
                        .listRowBackground(Color.theme.background.opacity(0.1))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.1))
//                    developerSection
//                        .listRowBackground(Color.theme.background.opacity(0.1))
//                    applicationSection
//                        .listRowBackground(Color.theme.background.opacity(0.1))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var aboutMeSection: some View {
        Section(header: Text("About Application")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This application is made to view the cryptocurrency market, there is no access to purchase. But you can keep track of individual cryptocurrencies that are interesting to you by adding them to your portfolio.")
                    .foregroundColor(colorScheme == .light ? Color.black : Color.theme.white)
            }
            .padding()
            
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The creptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .foregroundColor(colorScheme == .light ? Color.black : Color.theme.white)
            }
            .padding()
            Link("Visit CoinGecko 🦎", destination: coinGecko)
            
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame( width: 100 ,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Pavel Andreev. It uses SwiftUI is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(colorScheme == .light ? Color.black : Color.theme.white)
            }
            .padding()
            Link("Visit My website", destination: coinGecko)
            Link("Linkedin", destination: linkedin)
            Link("Github", destination: github)
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
            
        }
    }
}
