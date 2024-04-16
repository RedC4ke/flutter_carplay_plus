//
//  FCPTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Flutter
import Foundation

protocol FCPTemplate: CPTemplate, FCPComponent {
    var templateData: FCPTemplateData { get }
    func wrap() -> WrappedTemplateData
}

extension FCPTemplate {
    var templateData: FCPTemplateData {
        set {
            self.setTemplateData(to: newValue)
        }
        get { self.templateData }
    }

    private func setTemplateData(to templateData: FCPTemplateData) {
        if let tabData = templateData.tabData {
            self.setTabData(to: tabData)
        }
    }

    private func setTabData(to fcpTabData: FCPTabData) {
        self.tabTitle = fcpTabData.tabTitle
        self.showsTabBadge = fcpTabData.showsTabBadge
        // TODO: fill image data
    }
}

protocol FCPModalTemplate: FCPTemplate {}

protocol FCPFullscreenTemplate: FCPTemplate {}

extension WrappedTemplateData {
    func unwrap() throws -> FCPTemplate {
        let templateData = self.data
        switch self.type {
        case .tabBar:
            if let tabBarTemplateData = self.tabBarTemplateData {
                return try FCPTabBarTemplate(with: templateData, tabBarTemplateData: tabBarTemplateData)
            }
        case .list:
            if let listTemplateData = self.listTemplateData {
                return try FCPListTemplate(with: templateData, listTemplateData: listTemplateData)
            }
        }

        throw FlutterError(type: .malformed_template_model)
    }
}
