//
//  FCPSceneDelegate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 30/03/2024.
//

import CarPlay

@available(iOS 14.0, *)
class FCPSceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    private static var interfaceController: CPInterfaceController?
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didConnect interfaceController: CPInterfaceController)
    {
        FCPSceneDelegate.interfaceController = interfaceController
        
        connectionStatusChanged(to: .connected)
//        let rootTemplate = SwiftFlutterCarplayPlugin.rootTemplate
//
//        if rootTemplate != nil {
//            FCPSceneDelegate.interfaceController?.setRootTemplate(rootTemplate!, animated: SwiftFlutterCarplayPlugin.animated, completion: nil)
//        }
    }
  
    func sceneDidBecomeActive(_ scene: UIScene) {
        connectionStatusChanged(to: .connected)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        connectionStatusChanged(to: .disconnected)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        connectionStatusChanged(to: .background)
    }
    
    private func connectionStatusChanged(to status: CarplayConnectionStatus) {
        FlutterCarplayPlusPlugin.instance?.coreFlutterApi.onConnectionStatusChanged(status: status, completion: { _ in })
    }
    
    public static func setRoot(template: FCPTemplate) {
        interfaceController?.setRootTemplate(template)
    }
    
    public static func push(template: FCPFullscreenTemplate, animated: Bool) {
        interfaceController?.pushTemplate(template, animated: animated, completion: { _, _ in })
    }
    
    public static func popTemplate(animated: Bool) {
        interfaceController?.popTemplate(animated: animated, completion: { _, _ in })
    }
    
    public static func popToRootTemplate(animated: Bool) {
        interfaceController?.popToRootTemplate(animated: animated, completion: { _, _ in })
    }
    
    public static func present(template: FCPModalTemplate, animated: Bool) {
        interfaceController?.presentTemplate(template, animated: animated, completion: { _, _ in })
    }
    
    public static func dismissTemplate(animated: Bool) {
        interfaceController?.dismissTemplate(animated: animated, completion: { _, _ in })
    }
    
    public static func getTemplates() -> [FCPTemplate] {
        return interfaceController?.fcpTemplates ?? []
    }
}
