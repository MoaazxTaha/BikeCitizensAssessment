//
//  Addresses.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 03/02/2022.
//

import Foundation


class AddressesData: Codable {
    var data:[Address]?
}

class Address : Codable {
    
    var name : String = String()
    var summary : String = String()
    var type : String = String()
    var lat : Double = Double()
    var lon : Double = Double()
    var id : String = String()
    var iconUrl : String = String()
    var isFavourite:Bool = false
    
    enum CodingKeys: String, CodingKey{
        case name, summary, type, lat, lon, id
        case iconUrl = "icon_url"
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey:.name)
        summary = try container.decode(String.self, forKey: .summary)
        type = try container.decode(String.self, forKey: .type)
        lat = try container.decode(Double.self, forKey: .lat)
        lon = try container.decode(Double.self, forKey: .lon)
        id = try container.decode(String.self, forKey: .id)
        iconUrl = try container.decode(String.self, forKey: .iconUrl)
        
        
        CoreDataManager.shared.retrieveAddresses {[weak self] savedFavourites in
            self?.isFavourite = savedFavourites.first(where: {$0.id == (self?.id ?? "")}) != nil
        }
    }
}

