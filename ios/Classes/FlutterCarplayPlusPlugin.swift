import Flutter
import UIKit

public class FlutterCarplayPlusPlugin: NSObject, FlutterPlugin, FlutterApplicationLifeCycleDelegate {
    public static var instance: FlutterCarplayPlusPlugin?
    let messenger: FlutterBinaryMessenger
    
    static let templateHostApi = TemplateHostApiImpl()
    
    let coreFlutterApi: CoreFlutterApi
    
    init(registrar: FlutterPluginRegistrar) {
        self.messenger = registrar.messenger()
        
        self.coreFlutterApi = CoreFlutterApi(binaryMessenger: messenger)
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        instance = FlutterCarplayPlusPlugin(registrar: registrar)
        
        TemplateHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: templateHostApi)
        
        registrar.addApplicationDelegate(instance!)
    }
}
