//
//  FCPTabBarTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

class FCPTabBarTemplate: FCPFullscreenTemplate {
    let uuid: String
    let templateData: FCPTemplateData
    let template: CPTemplate

    let templates: [FCPTemplate]

    init(with templateData: FCPTemplateData, tabBarTemplateData: FCPTabBarTemplateData) throws {
        let templates: [FCPTemplate] = try tabBarTemplateData.templates.compactMap {
            try $0?.unwrap()
        }
        let cpTemplates = templates.map { $0.template }
        template = CPTabBarTemplate(templates: cpTemplates)

        uuid = templateData.componentData.componentId
        self.templateData = templateData
        self.templates = templates
    }

    func wrap() -> WrappedTemplateData {
        return WrappedTemplateData(type: .tabBar, data: templateData)
    }

    func getChildComponents() -> [any FCPComponent] {
        return templates.fcpComponents()
    }
}
