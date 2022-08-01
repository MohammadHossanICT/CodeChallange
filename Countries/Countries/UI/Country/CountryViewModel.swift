//
//  CountryViewModel.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import Foundation
import Combine

protocol CountryViewModelInput {
    func getCountires() async
}

protocol CountryViewModelOutput {
    var state: CountryViewStates {get}
    var countryRecordsCount: Int {get}
    func getCountry(index: Int)-> Country
}

final class CountryViewModel {
   
    private var countryRepository: CountriesRepository

    private var countires: [Country] = []
 
    @Published  var state: CountryViewStates = .none
    
    private var cancellables:Set<AnyCancellable> = Set()
    
    init(countryRepository: CountriesRepository) {
        self.countryRepository = countryRepository
    }
}

extension CountryViewModel: CountryViewModelOutput {
    var countryRecordsCount: Int {
        return countires.count
    }
    func getCountry(index: Int) -> Country {
        return countires[index]
    }
}

//extension SearchViewModel: SearchViewModelAction {
//    func navigateToGallery(for index:Int) {
//
//        guard let url = videoRecords[index].videoUrl else {
//            state = .showError(APIError.invalidData.localizedDescription)
//            return
//        }
//        state = .showVideoGallery(url)
//    }
//}

extension CountryViewModel: CountryViewModelInput {
    func getCountires() async {
        state = .showActivityIndicator
        do {
            countires = try await  countryRepository.loadCountries()
            self.state = .showCountryList
        } catch {
            countires = []
            state = .showError((error as! APIError).localizedDescription)
        }
    }
}

