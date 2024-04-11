import Flutter
import UIKit

public class FlutterCarplayPlusPlugin: NSObject, FlutterPlugin, FlutterApplicationLifeCycleDelegate {
    public static var instance: FlutterCarplayPlusPlugin?
    
    static let templateHostApi = Template
    
    var messenger: FlutterBinaryMessenger
    var coreFlutterApi: CoreFlutterApi
    
    init(registrar: FlutterPluginRegistrar) {
        self.messenger = registrar.messenger()
        
        self.coreFlutterApi = CoreFlutterApi(binaryMessenger: messenger)
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        instance = FlutterCarplayPlusPlugin(registrar: registrar)
        
        registrar.addApplicationDelegate(instance!)
    }
}
