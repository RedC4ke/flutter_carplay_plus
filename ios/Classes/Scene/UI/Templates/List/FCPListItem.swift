//
//  FCPListItem.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 17/04/2024.
//

import CarPlay
import Foundation

class FCPListItem: CPListItem, FCPListTemplateItem {
    let uuid: String

    init(itemData: FCPListTemplateItemData, listItemData: FCPListItemData) {
        self.uuid = itemData.componentData.componentId
        if #available(iOS 15.0, *) {
            self.isEnabled = itemData.isEnabled
        }

        self.isExplicitContent = listItemData.isExplicitContent
        self.isPlaying = listItemData.isPlaying
        self.playingIndicatorLocation = listItemData.playingIndicatorLocation.cp
        self.playbackProgress = listItemData.playbackProgress

        super.init(
            text: itemData.text,
            detailText: listItemData.detailText,
            image: UIImage.fromFCPImageData(listItemData.image),
            accessoryImage: UIImage.fromFCPImageData(listItemData.accessoryImage),
            accessoryType: listItemData.accessoryType.cp
        )
    }
}
