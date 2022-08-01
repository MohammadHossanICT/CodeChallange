//
//  CountriesRepository.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
}

class MainCoordinator: Coordinator {
  
   private var navController: UINavigationController
    
    init(navBarController: UINavigationController) {
        self.navController = navBarController
    }
    
    func start() {
        
        let countryRepository = RealCountriesRepository(session: URLSession.shared, baseURL:EndPoint.baseUrl)
        
        
        let  countryViewModel = CountryViewModel(countryRepository: countryRepository)
        
        let countriesViewController = CountriesViewController.storyboardViewController()
        
        navController.viewControllers = [countriesViewController]
        
        countriesViewController.viewModel = countryViewModel
        
        countriesViewController.coordinator = self
    }
}
