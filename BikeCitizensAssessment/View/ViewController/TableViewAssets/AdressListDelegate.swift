//
//  AdressListDelegate.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 06/02/2022.
//

import Foundation
import UIKit

class AdressListDelegate:NSObject,UITableViewDelegate {
    
    var addressesList: [Address]
    var shouldPopupCell:(PopUpAddressDetailsController)->Void = {_ in}
    
    private var listIsEmpty:Bool {
        return addressesList.isEmpty
    }
    
    init (_ addressList:[Address]){
        self.addressesList = addressList
        super.init()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !listIsEmpty else {return}
        let vm = PopUpAddressDetailsViewModel(addressesList[indexPath.row])
        let selectedAddressVC = PopUpAddressDetailsController(viewModel:vm)
        shouldPopupCell(selectedAddressVC)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

