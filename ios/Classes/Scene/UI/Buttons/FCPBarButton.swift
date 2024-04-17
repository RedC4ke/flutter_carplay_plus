//
//  FCPBarButton.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 15/04/2024.
//

import CarPlay
import Foundation

class FCPBarButton: CPBarButton, FCPComponent {
    let uuid: String

    init(with data: FCPBarButtonData) {
        self.uuid = data.componentData.componentId

        if data.type == .text {
            super.init(title: data.title ?? "", handler: <#T##CPBarButtonHandler?##CPBarButtonHandler?##(CPBarButton) -> Void#>)
        } else {
            super.init(image: UIImage.fromFCPImageData(data.image) ?? UIImage(), handler: <#T##CPBarButtonHandler?##CPBarButtonHandler?##(CPBarButton) -> Void#>)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
