//
//  PlatformClient.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 30/03/2024.
//

import Foundation
import Flutter

class PlatformClient {
    private final var coreApi: CoreFlutterApi
    
    init(messenger: FlutterBinaryMessenger) {
        self.coreApi = CoreFlutterApi(binaryMessenger: messenger)
    }
}
