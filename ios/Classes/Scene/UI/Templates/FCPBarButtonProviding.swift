//
//  FCPBarButtonProviding.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 15/04/2024.
//

import CarPlay
import Foundation

protocol FCPBarButtonProviding: CPBarButtonProviding {
    var barButonProvidingData: FCPBarButtonProvidingData? { get }
}

extension FCPBarButtonProviding {
    var barButtonProvidingData: FCPBarButtonProvidingData? {
        set {
            if let data = newValue {
                setBarButtonProvidingData(to: data)
            }
        }
        get { barButonProvidingData }
    }

    private func setBarButtonProvidingData(to data: FCPBarButtonProvidingData) {
        if let backButtonData = data.backButtonData {
            // backButton = backButtonData.deserialize()
        }
    }
}
