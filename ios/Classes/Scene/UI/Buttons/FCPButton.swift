//
//  FCPButton.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 23/04/2024.
//

import CarPlay
import Foundation

class FCPButton: CPButton, FCPInteractiveComponent {
    let uuid: String
    var completer: (() -> Void)?

    init(data: FCPButtonData) throws {
        let _uuid = data.componentData.componentId
        uuid = _uuid

        super.init(
            image: UIImage.fromFCPImageData(data.image) ?? UIImage(),
            handler: { _ in
                FCPButton.startHandler(_uuid)
            }
        )

        title = data.title
        isEnabled = data.isEnabled
    }

    func getChildComponents() -> [any FCPComponent] {
        return []
    }
}
