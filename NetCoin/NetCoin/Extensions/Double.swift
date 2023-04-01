/*

  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import Foundation
/// Converts a Double into a Currency with 2 decimal places
/// ```
/// Convert 123043.435324 to 123043.44
extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
        func toCurrency() -> String {
            return currencyFormatter.string(for: self) ?? "$0.00"
        }
        func toPercentString()-> String {
            guard let numberAsString = numberFormatter.string(for: self) else {return "" }
            return numberAsString + "%"
        }
    }

