//
//  AdressListDataSource.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 04/02/2022.
//

import UIKit



class AdressListDataSource: NSObject,UITableViewDataSource {
    
    var adressList:[Address]
    
    private var listIsEmpty:Bool {
        return adressList.isEmpty
    }
    
    init(adressesList:[Address]) {
        self.adressList = adressesList
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !listIsEmpty else {return 1}
        
        return (adressList.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !listIsEmpty else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmptySearchBarCellController.cellIdentifier, for: indexPath) as! EmptySearchBarCellController
            tableView.separatorStyle = .none
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressDetailsCellController.cellIdentifier, for: indexPath) as! AddressDetailsCellController
        cell.viewModel = AddressDetailsCellViewModel(adressList[indexPath.row])
        return cell
    }
}


