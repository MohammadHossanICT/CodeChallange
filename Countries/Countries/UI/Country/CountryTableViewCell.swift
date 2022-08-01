//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func configureData(country: Country) {
        nameLabel.text = country.name
        populationLabel.text = "\(country.population)"
        configureAccessibility(country: country)
    }
   
    private func configureAccessibility(country: Country) {
        self.accessibilityValue = "name of country is \(country.name) and population is \(country.population)"
        
        self.accessibilityFrame = self.nameLabel.frame
    }

}
