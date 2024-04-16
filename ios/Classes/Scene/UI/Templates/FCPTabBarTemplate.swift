//
//  FCPTabBarTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

class FCPTabBarTemplate: CPTabBarTemplate, FCPFullscreenTemplate {
    let uuid: String
    let templateData: FCPTemplateData

    init(with templateData: FCPTemplateData, tabBarTemplateData: FCPTabBarTemplateData) throws {
        self.uuid = templateData.componentData.componentId
        self.templateData = templateData

        let templates: [CPTemplate] = try tabBarTemplateData.templates.compactMap {
            try $0?.unwrap()
        }

        super.init(templates: templates)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func wrap() -> WrappedTemplateData {
        return WrappedTemplateData(type: .tabBar, data: templateData)
    }
}
