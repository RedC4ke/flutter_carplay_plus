import Flutter
import UIKit

public class FlutterCarplayPlusPlugin: NSObject, FlutterPlugin, FlutterApplicationLifeCycleDelegate {
    public static var instance: FlutterCarplayPlusPlugin?
    let messenger: FlutterBinaryMessenger
    
    static let templateHostApi = TemplateHostApiImpl()
    
    let coreFlutterApi: CoreFlutterApi
    let templateFlutterApi: TemplateFlutterApi
    
    init(registrar: FlutterPluginRegistrar) {
        self.messenger = registrar.messenger()
        
        self.coreFlutterApi = CoreFlutterApi(binaryMessenger: messenger)
        self.templateFlutterApi = TemplateFlutterApi(binaryMessenger: messenger)
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        instance = FlutterCarplayPlusPlugin(registrar: registrar)
        
        TemplateHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: templateHostApi)
        
        registrar.addApplicationDelegate(instance!)
    }
}
