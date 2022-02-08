//
//  PopUpAddressDetails.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 05/02/2022.
//

import UIKit
import MapKit

class PopUpAddressDetailsController: UIViewController {
    
    @IBOutlet weak var addressIcon: UIImageView!
    @IBOutlet weak var addressFavouriteBtn: UIButton!
    @IBOutlet weak var addressName: UILabel!
    @IBOutlet weak var addressSummery: UILabel!
    @IBOutlet weak var addressOnMap: MKMapView!
    
    var viewModel:PopUpAddressDetailsViewModel
    
    init(viewModel:PopUpAddressDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // View configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePopup()
        bindReachability()
    }
    
    func configurePopup() {
        //SuperView
        if let sheetController = self.presentationController as? UISheetPresentationController {
            sheetController.detents = [.medium(), .large()]
            sheetController.prefersEdgeAttachedInCompactHeight = true
            sheetController.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheetController.prefersGrabberVisible = true
            sheetController.preferredCornerRadius = 25.0
        }
        
        //addressIcon
        addressIcon.sd_setImage(with: URL(string:(viewModel.address.iconUrl)))
        
        //addressFavouriteBtn
        addressFavouriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        addressFavouriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        addressFavouriteBtn.isSelected = viewModel.address.isFavourite
        addressFavouriteBtn.addTarget(self, action: #selector(favouritePressed), for: .touchUpInside)
        
        // addressName
        addressName.text = viewModel.address.name
        
        //addressSummery
        addressSummery.text = viewModel.address.summary
        
        //Create the pin location of selected adress.
        let locationCoordinates = CLLocationCoordinate2D(latitude: (viewModel.address .lat), longitude: (viewModel.address.lon))
        let viewRegion = MKCoordinateRegion(center: locationCoordinates,latitudinalMeters: 400, longitudinalMeters: 400)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationCoordinates
        addressOnMap.setRegion(viewRegion, animated: false)
        addressOnMap.setCenter(locationCoordinates, animated: true)
        addressOnMap.addAnnotation(annotation)
        
    }
    
    @objc func favouritePressed() {
        viewModel.favoriteIsTriggered()
        addressFavouriteBtn.isSelected = viewModel.address.isFavourite
    }
    
    deinit {
        unbindReachability()
    }
}

