//
//  TemplateHostApi.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import Flutter
import Foundation

class TemplateHostApiImpl: NSObject, TemplateHostApi {
    private var templateStack: [FCPTemplate] = []
    private var modalTemplate: FCPModalTemplate?

    private var flutterApi: TemplateFlutterApi? {
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

    func presentTemplate(wrappedTemplateData: WrappedTemplateData, animated: Bool) throws {
        let template = try wrappedTemplateData.unwrap()
        guard let modalTemplate = template as? FCPModalTemplate else {
            throw FlutterError(type: .malformed_template_model)
        }

        self.modalTemplate = modalTemplate
        FCPSceneDelegate.present(template: modalTemplate, animated: animated)
    }

    func popTemplate(animated: Bool) throws {
        FCPSceneDelegate.popTemplate(animated: animated)

        if !templateStack.isEmpty { templateStack.removeLast() }
    }

    func dismissTemplate(animated: Bool) throws {
        FCPSceneDelegate.dismissTemplate(animated: animated)

        modalTemplate = nil
    }

    func popToRootTemplate(animated: Bool) throws {
        FCPSceneDelegate.popToRootTemplate(animated: animated)

        if !templateStack.isEmpty { templateStack = [templateStack.first!] }
    }

    func interactionCompleted(objectId: String) throws {
        let component = findComponent(with: objectId)
        if var interactiveComponent = component as? FCPInteractiveComponent {
            interactiveComponent.completeHandler()
        }
    }

    func updateTabBarChildTemplates(tabBarTemplateId: String, templates: [WrappedTemplateData?]) throws {}

    private func findComponent(with uuid: String) -> FCPComponent? {
        for template in templateStack {
            if template.uuid == uuid { return template }

            for child in template.getComponentHierarchy() {
                if child.uuid == uuid { return child }
            }
        }

        return nil
    }
}
