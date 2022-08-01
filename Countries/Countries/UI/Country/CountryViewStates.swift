//
//  CountryViewStates.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import Foundation

enum CountryViewStates: Equatable {
    case showActivityIndicator
    case showCountryList
    case showError(String)
    case none
}
