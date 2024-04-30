//
//  FCPListTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

class FCPListTemplate: FCPFullscreenTemplate, FCPBarButtonProviding {
    let uuid: String
    let templateData: FCPTemplateData
    let template: CPTemplate
    let cpListTemplate: CPListTemplate
    let barButonProvidingData: FCPBarButtonProvidingData?

    let sections: [FCPListSection]

    init(with templateData: FCPTemplateData, listTemplateData: FCPListTemplateData) throws {
        let sections = try listTemplateData.sections.compactMap { section in
            if let sectionData = section {
                return try FCPListSection(with: sectionData)
            }

            return nil
        }
        self.cpListTemplate = CPListTemplate(title: listTemplateData.title, sections: sections.map { $0.section })
        self.template = cpListTemplate

        self.uuid = templateData.componentData.componentId
        self.templateData = templateData
        self.barButtonProvidingData = listTemplateData.barButtonProvidingData
    }

    func wrap() -> WrappedTemplateData {
        return WrappedTemplateData(type: .list, data: templateData)
    }

    func getChildComponents() -> [any FCPComponent] {
        var components = sections.fcpComponents() + leadingNavigationBarButtons.fcpComponents() + trailingNavigationBarButtons.fcpComponents()
        if let fcpBackButton = backButton as? FCPComponent {
            components.append(fcpBackButton)
        }

        return components
    }
}
