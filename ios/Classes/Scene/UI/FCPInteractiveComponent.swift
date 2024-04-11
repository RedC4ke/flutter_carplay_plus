//
//  FCPInteractiveComponent.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import Foundation

protocol FCPInteractiveComponent {
    var uuid: String { get }
}

extension FCPInteractiveComponent {
    var componentData: FCPComponentData {
        return FCPComponentData(componentId: uuid)
    }
}
