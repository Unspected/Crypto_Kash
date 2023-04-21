//
//  Double.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/20/23.
//

import Foundation

extension Double {
    
    /// Converts double to currency with 2 decemal places
    /// ```
    /// Convert to 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
    //    formater.locale = .current // <- default value
    //    formater.currencyCode = "usd" // change currency
    //    formater.currencySymbol = "$" // change currency symbol
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 2
        return formater
    }
    
    /// ```
    /// Convert to 1.56 to "$1.56"
    /// ```

    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    /// Converts double to currency with 2-6 decemal places
    /// ```
    /// Convert to 1234.56 to $1,234.56
    /// Convert to 12.3456 to $12.3456
    /// Convert to 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formater = NumberFormatter()
        formater.usesGroupingSeparator = true
        formater.numberStyle = .currency
    //    formater.locale = .current // <- default value
    //    formater.currencyCode = "usd" // change currency
    //    formater.currencySymbol = "$" // change currency symbol
        formater.minimumFractionDigits = 2
        formater.maximumFractionDigits = 6
        
        return formater
    }
    
    /// ```
    /// Convert to 1234.56 to "$1,234.56"
    /// Convert to 12.3456 to "$12.3456"
    /// Convert to 0.123456 to "$0.123456"
    /// ```

    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// ```
    /// Convert to 1.2345 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
//        let formatter = NumberFormatter()
//        formatter.minimumFractionDigits = 0 // Set minimum number of decimals
//        formatter.maximumFractionDigits = 2 // Set maximum number of decimals
//        let formattedNumber = formatter.string(from: NSNumber(value: self))
//        return formattedNumber!
    }
    
    /// Converts double into string with percentage symbol
    /// ```
    /// Convert to 1.2345 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
        
    }
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
            let num = abs(Double(self))
            let sign = (self < 0) ? "-" : ""

            switch num {
            case 1_000_000_000_000...:
                let formatted = num / 1_000_000_000_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)Tr"
            case 1_000_000_000...:
                let formatted = num / 1_000_000_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)Bn"
            case 1_000_000...:
                let formatted = num / 1_000_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)M"
            case 1_000...:
                let formatted = num / 1_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)K"
            case 0...:
                return self.asNumberString()

            default:
                return "\(sign)\(self)"
            }
        }
}
