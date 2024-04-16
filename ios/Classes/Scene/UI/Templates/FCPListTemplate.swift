//
//  FCPListTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

class FCPListTemplate: CPListTemplate, FCPFullscreenTemplate, FCPBarButtonProviding {
    let uuid: String
    let templateData: FCPTemplateData
    let barButonProvidingData: FCPBarButtonProvidingData?

    init(with templateData: FCPTemplateData, listTemplateData: FCPListTemplateData) throws {
        self.uuid = templateData.componentData.componentId
        self.templateData = templateData
        self.barButtonProvidingData = listTemplateData.barButtonProvidingData

        // TODO: fill the rest of the params
        super.init(title: listTemplateData.title, sections: [])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func wrap() -> WrappedTemplateData {
        return WrappedTemplateData(type: .list, data: templateData)
    }
}
