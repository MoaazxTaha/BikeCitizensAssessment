//
//  SearchAdressListViewModel.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 04/02/2022.
//

import Foundation

class SearchAddressViewModel{
    
    internal var addressesList:[Address] = [] {
        willSet {
            dataSource.adressList = newValue
        }
    }
    
    internal let dataSource = AdressListDataSource(adressesList: [])
    internal var searchingTerm:String = ""
    
    
    func fetchAdressList(compilation: @escaping ()->Void) {
        NetworkLayer.shared.fetch(api: .searchAdress(searchingTerm), model: AddressesData.self) {[weak self] addressData in
            guard let self = self, let newList = addressData?.data else {return}
            self.addressesList = newList
            compilation()
        }
    }
}
