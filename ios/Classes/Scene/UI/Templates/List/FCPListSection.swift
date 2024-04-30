//
//  FCPListSection.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 16/04/2024.
//

import CarPlay
import Foundation

class FCPListSection: FCPComponent {
    let uuid: String
    let section: CPListSection

    let items: [FCPListTemplateItem]

    init(with data: FCPListSectionData) throws {
        let componentData = data.componentData
        uuid = componentData.componentId

        var headerButton: FCPButton?
        if let buttonData = data.headerButton {
            headerButton = try FCPButton(data: buttonData)
        }

        items = try data.items.compactMap { data in
            try data?.unwrap()
        }

        if #available(iOS 15.0, *) {
            section = CPListSection(
                items: items.map { $0.item },
                header: data.header ?? "",
                headerSubtitle: data.headerSubtitle,
                headerImage: UIImage.fromFCPImageData(data.headerImage),
                headerButton: headerButton,
                sectionIndexTitle: data.sectionIndexTitle
            )
        } else {
            section =
                CPListSection(
                    items: items as [any CPListTemplateItem],
                    header: data.header ?? "",
                    sectionIndexTitle: data.sectionIndexTitle
                )
        }
    }

    func getChildComponents() -> [any FCPComponent] {
        return items.fcpComponents()
    }
}
