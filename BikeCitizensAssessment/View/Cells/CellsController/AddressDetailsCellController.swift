//
//  AdressDetails.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 03/02/2022.
//

import UIKit

class AddressDetailsCellController: UITableViewCell {
    
    static let cellIdentifier = "AddressDetailsCellController"
    
    @IBOutlet weak var adressName: UILabel!
    @IBOutlet weak var adrsssSummery: UILabel!
    @IBOutlet weak var adressIcon: UIImageView!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    var viewModel:AddressDetailsCellViewModel? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        guard let viewModel = viewModel else {return}
        adressName.text = viewModel.address.name
        adrsssSummery.text = viewModel.address.name
        adressIcon.sd_setImage(with: URL(string:( viewModel.address.iconUrl)), placeholderImage: UIImage(systemName: "mappin.circle"))
        
        favoriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favoriteBtn.isSelected = viewModel.address.isFavourite
        favoriteBtn.addTarget(self, action: #selector(favouritePressed), for: .touchUpInside)
    }
    
    @objc func favouritePressed() {
        guard let viewModel = viewModel else {return}
        viewModel.favoriteIsTriggered()
    }
}


