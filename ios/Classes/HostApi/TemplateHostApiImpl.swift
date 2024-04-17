//
//  TemplateHostApi.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import Flutter
import Foundation

class TemplateHostApiImpl: NSObject, TemplateHostApi {
    var flutterApi: TemplateFlutterApi? {
        return FlutterCarplayPlusPlugin.instance?.templateFlutterApi
    }

    func pushTemplate(wrappedTemplateData: WrappedTemplateData, animated: Bool, asRoot: Bool) throws {
        let template = try wrappedTemplateData.unwrap()
        if let fullscreenTemplate = template as? FCPFullscreenTemplate {
            if asRoot {
                FCPSceneDelegate.setRoot(template: fullscreenTemplate)
            } else {
                FCPSceneDelegate.push(template: fullscreenTemplate, animated: animated)
            }
            return
        }

        if let modalTemplate = template as? FCPModalTemplate {
            FCPSceneDelegate.present(template: modalTemplate, animated: animated)
        }
    }

    func updateTabBarChildTemplates(tabBarTemplateId: String, templates: [WrappedTemplateData?]) throws {}
}
