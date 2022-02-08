//
//  FavouriteAddressesViewModel.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 06/02/2022.
//

import Foundation

class FavouriteAddressesViewModel {
    
    internal var favourites:[Address] = [] {
        willSet {
            dataSource.adressList = newValue
        }
    }
    
    internal let dataSource = AdressListDataSource(adressesList: [])
    
    func loadFavouritelist(compilation: @escaping ()->Void) {
        CoreDataManager.shared.retrieveAddresses(completion: { [weak self] favourites in
            self?.favourites = favourites
            compilation()
        })
    }

}
