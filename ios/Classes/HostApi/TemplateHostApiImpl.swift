//
//  TemplateHostApi.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import Flutter
import Foundation

class TemplateHostApiImpl: NSObject, TemplateHostApi {
    func pushTemplate(wrappedTemplateData: WrappedTemplateData, animated: Bool, asRoot: Bool) throws {
        throw FlutterError()
    }

    func updateTabBarChildTemplates(tabBarTemplateId: String, templates: [WrappedTemplateData?]) throws {}
}
