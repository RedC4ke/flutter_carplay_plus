//
//  FCPInteractiveComponent.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import Foundation

protocol FCPComponent {
    var uuid: String { get }

    func getChildComponents() -> [FCPComponent]
}

extension FCPComponent {
    func getComponentHierarchy() -> [FCPComponent] {
        return [self] + getChildComponents()
    }
}

protocol FCPInteractiveComponent: FCPComponent {
    var completer: (() -> Void)? { get set }
}

extension FCPInteractiveComponent {
    func startHandler() {
        FlutterCarplayPlusPlugin.instance?.templateFlutterApi.interactionStarted(objectId: uuid, completion: { _ in })
    }

    static func startHandler(_ uuid: String) {
        FlutterCarplayPlusPlugin.instance?.templateFlutterApi.interactionStarted(objectId: uuid, completion: { _ in })
    }

    mutating func completeHandler() {
        completer?()
        completer = nil
    }
}
