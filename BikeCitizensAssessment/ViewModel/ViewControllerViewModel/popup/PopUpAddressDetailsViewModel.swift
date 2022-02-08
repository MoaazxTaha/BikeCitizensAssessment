//
//  PopUpAddressDetailsViewModel.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 06/02/2022.
//

import Foundation

class PopUpAddressDetailsViewModel:Favoritable {
    var address: Address
    
    init(_ address:Address) {
        self.address = address
    }
    
}
