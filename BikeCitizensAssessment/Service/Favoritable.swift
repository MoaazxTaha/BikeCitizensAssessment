//
//  FavouriteManager.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 06/02/2022.
//

import Foundation

protocol Favoritable{
    var address: Address { get set }
}

extension Favoritable {
    
    func favoriteIsTriggered() {
        address.isFavourite = !address.isFavourite
        
        if address.isFavourite {
            CoreDataManager.shared.insert(address: address)
        } else {
            CoreDataManager.shared.deleteSingleEntry(address: address)
        }
    }
    
}
