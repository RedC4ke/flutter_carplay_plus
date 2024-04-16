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

extension FlutterError: Swift.Error {
    convenience init(type: FCPError) {
        self.init(code: type.name, message: type.rawValue, details: nil)
    }
}

enum FCPError: String {
    case malformed_template_model = "Your WrappedTemplateData model is malformed. Make sure that specified FCPTemplateType enum matches designated data field."
}

extension FCPError {
    var name: String {
        "\(self)"
    }
}
