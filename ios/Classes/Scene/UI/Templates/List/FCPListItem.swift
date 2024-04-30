//
//  FCPListItem.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 17/04/2024.
//

import CarPlay
import Foundation

class FCPListItem: FCPListTemplateItem {
    let uuid: String
    let item: CPListItem
    var completer: (() -> Void)?

    init(itemData: FCPListTemplateItemData, listItemData: FCPListItemData) {
        self.uuid = itemData.componentData.componentId

        self.item = CPListItem(
            text: itemData.text,
            detailText: listItemData.detailText,
            image: UIImage.fromFCPImageData(listItemData.image),
            accessoryImage: UIImage.fromFCPImageData(listItemData.accessoryImage),
            accessoryType: listItemData.accessoryType.cp
        )

        if #available(iOS 15.0, *) {
            item.isEnabled = itemData.isEnabled
        }

        item.isExplicitContent = listItemData.isExplicitContent
        item.isPlaying = listItemData.isPlaying
        item.playingIndicatorLocation = listItemData.playingIndicatorLocation.cp
        item.playbackProgress = listItemData.playbackProgress

        item.handler = { _, complete in
            DispatchQueue.main.async {
                self.completer = complete
                self.startHandler()
            }
        }
    }

    func getChildComponents() -> [any FCPComponent] {
        return []
    }
}
