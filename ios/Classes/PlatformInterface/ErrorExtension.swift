//
//  ErrorExtension.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 29/03/2024.
//

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif


extension FlutterError: Swift.Error {}
