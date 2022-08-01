//
//  CountriesViewController.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import UIKit
import Combine

final class CountriesViewController: UIViewController, Alertable {

    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel:CountryViewModel?
    weak var coordinator: Coordinator?

    private var bindings = Set<AnyCancellable>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("country", comment:"")
        search()
        setupBinding()
    }
}


// MARK: - Private Methods

extension CountriesViewController {
    private func search() {
        Task {
            await viewModel?.getCountires()
        }
    }
    
    private func setupBinding() {
        viewModel?.$state.receive(on: RunLoop.main).sink(receiveValue: {[weak self] states in
            switch states {
            case .showActivityIndicator:
                self?.showActivity()
            case .showCountryList:
                self?.hideActivity()
                self?.tableView.reloadData()
            case .showError( let message):
                self?.hideActivity()
                self?.showAlert(message:message)
            case .none:
                self?.hideActivity()
            }
        }).store(in: &bindings)
    }
        
    private func showActivity() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    private func hideActivity() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
}

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.countryRecordsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! CountryTableViewCell
        
        if let viewModel = viewModel {
            let country = viewModel.getCountry(index: indexPath.row)
            cell.configureData(country: country)
        }
     
        return cell
    }
}

extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel?.navigateToGallery(for: indexPath.row)
    }
}
