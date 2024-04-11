//
//  FCPTabBarTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

class FCPTabBarTemplate: CPTabBarTemplate, FCPTemplate {
    let uuid: String
    var tabData: FCPTabData?

    init(tabBarTemplateData: FCPTabBarTemplateData) {
        let templateData = tabBarTemplateData.data

        self.uuid = templateData.componentData.componentId
        self.tabData = templateData.tabData

        let templates: [CPTemplate] = tabBarTemplateData.templates.compactMap {
            $0?.toFCPTemplate()
        }

        super.init(templates: templates)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
