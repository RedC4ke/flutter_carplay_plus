//
//  FCPListSectionItem.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 17/04/2024.
//

import CarPlay
import Flutter
import Foundation

protocol FCPListTemplateItem: CPListTemplateItem, FCPComponent {}

extension WrappedListItemData {
    func unwrap() throws -> FCPListTemplateItem {
        switch self.type {
        case .listItem:
            if let listItemData = self.listItemData {
                return FCPListItem(itemData: self.itemData, listItemData: listItemData)
            }
        default:
            throw FlutterError(type: .unimplemented)
        }

        throw FlutterError(type: .malformed_list_item_model)
    }
}
