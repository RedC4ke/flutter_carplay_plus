//
//  FCPListTemplate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import CarPlay
import Foundation

class FCPListTemplate: CPListTemplate, FCPTemplate, FCPBarButtonProviding {
    let uuid: String
    var tabData: FCPTabData?
    var barButtonProvidingData: FCPBarButtonProvidingData?

    init(listTemplateData: FCPListTemplateData) {
        let templateData = listTemplateData.data

        self.uuid = templateData.componentData.componentId
        self.tabData = templateData.tabData

        self.barButtonProvidingData = listTemplateData.barButtonProvidingData

        // TODO: fill the rest of the params
        super.init(title: "", sections: [])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
