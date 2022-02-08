//
//  EmptySearchBarCell.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 04/02/2022.
//

import UIKit

class EmptySearchBarCellController: UITableViewCell {
    
    @IBOutlet var searchMessage: UILabel!
    
    static let cellIdentifier = "EmptySearchBarCellController"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        selectionStyle = .none
        searchMessage.text = "search for an Adress \n with a few keywords \n and add it to \n Your Favourite"
    }
}
