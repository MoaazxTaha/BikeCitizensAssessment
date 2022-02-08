//
//  Bundle+Extensions.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 03/02/2022.
//

import Foundation

enum BundleAssets: String {
    case info = "Info"
    case plist = "plist"
    case baseURL = "BaseURL"
}

extension Bundle {
    var baseURL: String {
        return object(forInfoDictionaryKey: BundleAssets.baseURL.rawValue) as? String ?? ""
    }
}
