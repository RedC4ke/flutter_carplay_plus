//
//  FCPSceneDelegate.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 30/03/2024.
//

import CarPlay

@available(iOS 14.0, *)
class FCPSceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
  static private var interfaceController: CPInterfaceController?
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                    didConnect interfaceController: CPInterfaceController) {
        FCPSceneDelegate.interfaceController = interfaceController
        
        connectionStatusChanged(to: CarplayConnectionStatus.connected)
//        let rootTemplate = SwiftFlutterCarplayPlugin.rootTemplate
//        
//        if rootTemplate != nil {
//            FCPSceneDelegate.interfaceController?.setRootTemplate(rootTemplate!, animated: SwiftFlutterCarplayPlugin.animated, completion: nil)
//        }
      }
  
    func sceneDidBecomeActive(_ scene: UIScene) {
        connectionStatusChanged(to: CarplayConnectionStatus.connected)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        connectionStatusChanged(to: CarplayConnectionStatus.disconnected)
    }
    
    private func connectionStatusChanged(to status: CarplayConnectionStatus) {
        FlutterCarplayPlusPlugin.instance?.coreFlutterApi.onConnectionStatusChanged(status: status, completion: {_ in })
    }
}
