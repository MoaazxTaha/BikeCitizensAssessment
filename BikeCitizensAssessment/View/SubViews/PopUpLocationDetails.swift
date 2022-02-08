////
////  PopUpLocationDetails.swift
////  BikeCitizensAssessment
////
////  Created by Moaaz Ahmed Fawzy Taha on 05/02/2022.
////
//
//import Foundation
//import UIKit
//
//private class PopupDetails:UIView  {
//    
//    let popupView = UIView(frame: CGRect.zero)
//    let addressIcon = UIImageView()
//    let addressName = UILabel(frame: CGRect.zero)
//    let addressSummery = UILabel(frame: CGRect.zero)
//    let addressFavouriteBtn = UIButton()
//    let location = UIImageView()
//    var addressDetails:AddressDetails?
//    
//    init() {
//        super.init(frame: CGRect.zero)
//        // Semi-transparent background
//        backgroundColor = UIColor.black.withAlphaComponent(0.3)
//        
//        //Setup Popup Screen
//        setPopupConstaints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configurePopup() {
//        
//        // popUpView
//        popupView.backgroundColor = .white
//        popupView.layer.masksToBounds = true
//        popupView.layer.cornerRadius = 30
//        popupView.layer.shadowColor = CGColor(gray: 1, alpha: 1)
//
//        //addressIcon
//        addressIcon.backgroundColor = UIColor.white
//
//        //addressFavouriteBtn
//        addressFavouriteBtn.titleLabel?.text = addressDetails?.id!
//        addressFavouriteBtn.backgroundColor = UIColor.clear
//        addressFavouriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
//        addressFavouriteBtn.tintColor = .black
//        addressFavouriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
//        addressFavouriteBtn.imageView?.tintColor = .black
//
//        // addressName
//        addressName.text = addressDetails?.name
//        addressName.textColor = UIColor.black
//        addressName.backgroundColor = UIColor.clear
//        addressName.layer.masksToBounds = true
//        addressName.adjustsFontSizeToFitWidth = true
//        addressName.clipsToBounds = true
//        addressName.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
//        addressName.numberOfLines = 0
//        addressName.textAlignment = .center
//
//        //addressSummery
//        addressSummery.text = addressDetails?.summary
//        addressSummery.textColor = UIColor.systemGray
//        addressSummery.backgroundColor = UIColor.clear
//        addressSummery.font = UIFont.systemFont(ofSize: 25.0, weight: .semibold)
//        addressSummery.numberOfLines = 0
//        addressSummery.textAlignment = .center
//
//        
//        //Locationimage
//        location.sd_setImage(with: URL(string:(addressDetails?.iconUrl)!))
//        location.backgroundColor = UIColor.clear
//    }
//    
//    func setPopupConstaints() {
//
//        // add Views to popupview
//        popupView.addSubview(addressIcon)
//        popupView.addSubview(addressFavouriteBtn)
//        popupView.addSubview(addressName)
//        popupView.addSubview(addressSummery)
//        popupView.addSubview(location)
//
//        // Add the popupView(box) in the PopUpWindowView (semi-transparent background)
//        addSubview(popupView)
//        
//        
//        //popupView Constraint
//        popupView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            popupView.heightAnchor.constraint(equalToConstant: self.frame.height),
//            popupView.widthAnchor.constraint(equalToConstant: self.frame.width),
//            popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//        ])
//        
//        // addressFavouriteBtn Constraint
//        addressFavouriteBtn.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            addressFavouriteBtn.widthAnchor.constraint(equalToConstant: 28),
//            addressFavouriteBtn.heightAnchor.constraint(equalToConstant: 24),
//            addressFavouriteBtn.topAnchor.constraint(equalTo: popupView.topAnchor),
//            addressFavouriteBtn.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: -30)
//        ])
//        
//        // adressIcon Constraint
//        addressIcon.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            addressIcon.widthAnchor.constraint(equalToConstant: 131),
//            addressIcon.heightAnchor.constraint(equalToConstant: 125),
//            addressIcon.topAnchor.constraint(equalTo: popupView.topAnchor, constant:6),
////            addressIcon.bottomAnchor.constraint(equalTo: addressName.topAnchor),
//            addressIcon.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
//        ])
//        
//        // addressName Constraint
//        addressName.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            addressName.widthAnchor.constraint(equalTo: popupView.widthAnchor),
//            addressName.topAnchor.constraint(equalTo: addressIcon.bottomAnchor),
//            addressName.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
//            addressName.bottomAnchor.constraint(equalTo: addressSummery.topAnchor)
//        ])
//        
//        //addressSummery Contraint
//        addressSummery.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            addressSummery.widthAnchor.constraint(equalToConstant: addressName.frame.width),
//            addressSummery.topAnchor.constraint(equalTo: addressName.bottomAnchor),
//            addressSummery.centerXAnchor.constraint(equalTo: popupView.centerXAnchor),
//            addressSummery.bottomAnchor.constraint(equalTo: location.topAnchor)
//        ])
//
//        //location Constraint
//        location.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            location.topAnchor.constraint(equalTo: addressSummery.bottomAnchor),
//            location.widthAnchor.constraint(equalTo: popupView.widthAnchor),
//            location.bottomAnchor.constraint(equalTo: popupView.bottomAnchor),
//            location.centerXAnchor.constraint(equalTo: popupView.centerXAnchor)
//        ])
//        
//    }
//    
//}
//class PopupAdressDetails: UIViewController {
//
//   
//
//
//
//
////    }
////frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 473)
////frame:CGRect(x: (view.frame.width), y: 37, width: 28, height: 24)
