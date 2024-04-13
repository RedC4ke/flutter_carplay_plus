//
//  FCPTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

protocol FCPTemplate: FCPInteractiveComponent, CPTemplate {
    var tabData: FCPTabData? { get }
}

extension FCPTemplate {
    private var tabData: FCPTabData? {
        set {
            if let newValue = tabData {
                self.setTabData(to: newValue)
            }
        }
        get { tabData }
    }

    func setTabData(to fcpTabData: FCPTabData) {
        self.tabTitle = fcpTabData.tabTitle
        self.showsTabBadge = fcpTabData.showsTabBadge
        // TODO: fill image data
    }
}

protocol FCPBarButtonProviding: CPBarButtonProviding {
    var barButtonProvidingData: FCPBarButtonProvidingData? { get }
}

extension FCPBarButtonProviding {
    private var barButtonProvidingData: FCPBarButtonProvidingData? {
        set {
            if let newValue = barButtonProvidingData {
                self.setBarButtonProvidingData(to: newValue)
            }
        }
        get { barButtonProvidingData }
    }

    func setBarButtonProvidingData(to: FCPBarButtonProvidingData) {
        // TODO: add button components
    }
}

extension WrappedTemplateData {
    func toFCPTemplate() -> FCPTemplate {
        switch self.type {
        case .tabBar: FCPTabBarTemplate(tabBarTemplateData: self.tabBarTemplateData!)
        case .list: FCPListTemplate(listTemplateData: self.listTemplateData!)
        // TODO: finish this method
        default: {
                throw fatalError("Unimplemented")
            }()
        }
    }
}
