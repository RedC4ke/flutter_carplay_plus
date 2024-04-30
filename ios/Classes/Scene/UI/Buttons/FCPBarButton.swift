//
//  FCPBarButton.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 15/04/2024.
//

import CarPlay
import Foundation

class FCPBarButton: CPBarButton, FCPInteractiveComponent {
    let uuid: String
    var completer: (() -> Void)?

    init(with data: FCPBarButtonData) {
        let _uuid = data.componentData.componentId
        self.uuid = _uuid

        if data.type == .text {
            super.init(
                title: data.title ?? ""
            ) { _ in
                FCPBarButton.startHandler(_uuid)
            }
        } else {
            super.init(
                image: UIImage.fromFCPImageData(data.image) ?? UIImage()
            ) { _ in
                FCPBarButton.startHandler(_uuid)
            }
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getChildComponents() -> [any FCPComponent] {
        return []
    }
}
