// Autogenerated from Pigeon (v17.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func createConnectionError(withChannelName channelName: String) -> FlutterError {
  return FlutterError(code: "channel-error", message: "Unable to establish connection on channel: '\(channelName)'.", details: "")
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum FCPImageSource: Int {
  case network = 0
}

enum FCPTemplateType: Int {
  case list = 0
  case modal = 1
  case tabBar = 2
}

enum FCPTemplateCategory: Int {
  case fullscreen = 0
  case modal = 1
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPComponentData {
  var componentId: String

  static func fromList(_ list: [Any?]) -> FCPComponentData? {
    let componentId = list[0] as! String

    return FCPComponentData(
      componentId: componentId
    )
  }
  func toList() -> [Any?] {
    return [
      componentId
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPImageData {
  var source: FCPImageSource
  var path: String

  static func fromList(_ list: [Any?]) -> FCPImageData? {
    let source = FCPImageSource(rawValue: list[0] as! Int)!
    let path = list[1] as! String

    return FCPImageData(
      source: source,
      path: path
    )
  }
  func toList() -> [Any?] {
    return [
      source.rawValue,
      path,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPSystemImageData {
  var symbolIdentifier: String

  static func fromList(_ list: [Any?]) -> FCPSystemImageData? {
    let symbolIdentifier = list[0] as! String

    return FCPSystemImageData(
      symbolIdentifier: symbolIdentifier
    )
  }
  func toList() -> [Any?] {
    return [
      symbolIdentifier
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPTabData {
  var tabTitle: String? = nil
  var tabImage: FCPImageData? = nil
  var tabSystemImage: FCPSystemImageData? = nil
  var showsTabBadge: Bool

  static func fromList(_ list: [Any?]) -> FCPTabData? {
    let tabTitle: String? = nilOrValue(list[0])
    var tabImage: FCPImageData? = nil
    if let tabImageList: [Any?] = nilOrValue(list[1]) {
      tabImage = FCPImageData.fromList(tabImageList)
    }
    var tabSystemImage: FCPSystemImageData? = nil
    if let tabSystemImageList: [Any?] = nilOrValue(list[2]) {
      tabSystemImage = FCPSystemImageData.fromList(tabSystemImageList)
    }
    let showsTabBadge = list[3] as! Bool

    return FCPTabData(
      tabTitle: tabTitle,
      tabImage: tabImage,
      tabSystemImage: tabSystemImage,
      showsTabBadge: showsTabBadge
    )
  }
  func toList() -> [Any?] {
    return [
      tabTitle,
      tabImage?.toList(),
      tabSystemImage?.toList(),
      showsTabBadge,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct WrappedTemplateData {
  var type: FCPTemplateType
  var listTemplateData: FCPListTemplateData? = nil
  var tabBarTemplateData: FCPTabBarTemplateData? = nil

  static func fromList(_ list: [Any?]) -> WrappedTemplateData? {
    let type = FCPTemplateType(rawValue: list[0] as! Int)!
    var listTemplateData: FCPListTemplateData? = nil
    if let listTemplateDataList: [Any?] = nilOrValue(list[1]) {
      listTemplateData = FCPListTemplateData.fromList(listTemplateDataList)
    }
    var tabBarTemplateData: FCPTabBarTemplateData? = nil
    if let tabBarTemplateDataList: [Any?] = nilOrValue(list[2]) {
      tabBarTemplateData = FCPTabBarTemplateData.fromList(tabBarTemplateDataList)
    }

    return WrappedTemplateData(
      type: type,
      listTemplateData: listTemplateData,
      tabBarTemplateData: tabBarTemplateData
    )
  }
  func toList() -> [Any?] {
    return [
      type.rawValue,
      listTemplateData?.toList(),
      tabBarTemplateData?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPTemplateData {
  var objectData: FCPComponentData
  var tabData: FCPTabData? = nil
  var category: FCPTemplateCategory

  static func fromList(_ list: [Any?]) -> FCPTemplateData? {
    let objectData = FCPComponentData.fromList(list[0] as! [Any?])!
    var tabData: FCPTabData? = nil
    if let tabDataList: [Any?] = nilOrValue(list[1]) {
      tabData = FCPTabData.fromList(tabDataList)
    }
    let category = FCPTemplateCategory(rawValue: list[2] as! Int)!

    return FCPTemplateData(
      objectData: objectData,
      tabData: tabData,
      category: category
    )
  }
  func toList() -> [Any?] {
    return [
      objectData.toList(),
      tabData?.toList(),
      category.rawValue,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPTabBarTemplateData {
  var templateData: FCPTemplateData
  var templates: [WrappedTemplateData?]

  static func fromList(_ list: [Any?]) -> FCPTabBarTemplateData? {
    let templateData = FCPTemplateData.fromList(list[0] as! [Any?])!
    let templates = list[1] as! [WrappedTemplateData?]

    return FCPTabBarTemplateData(
      templateData: templateData,
      templates: templates
    )
  }
  func toList() -> [Any?] {
    return [
      templateData.toList(),
      templates,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPListTemplateData {
  var templateData: FCPTemplateData
  var barButtonProvidingData: FCPBarButtonProvidingData? = nil

  static func fromList(_ list: [Any?]) -> FCPListTemplateData? {
    let templateData = FCPTemplateData.fromList(list[0] as! [Any?])!
    var barButtonProvidingData: FCPBarButtonProvidingData? = nil
    if let barButtonProvidingDataList: [Any?] = nilOrValue(list[1]) {
      barButtonProvidingData = FCPBarButtonProvidingData.fromList(barButtonProvidingDataList)
    }

    return FCPListTemplateData(
      templateData: templateData,
      barButtonProvidingData: barButtonProvidingData
    )
  }
  func toList() -> [Any?] {
    return [
      templateData.toList(),
      barButtonProvidingData?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPBarButtonProvidingData {
  var backButtonData: FCPBarButtonData? = nil
  var leadingNavigationBarButtonsData: [FCPBarButtonData?]? = nil
  var trailingNavigationBarButtonsData: [FCPBarButtonData?]? = nil

  static func fromList(_ list: [Any?]) -> FCPBarButtonProvidingData? {
    var backButtonData: FCPBarButtonData? = nil
    if let backButtonDataList: [Any?] = nilOrValue(list[0]) {
      backButtonData = FCPBarButtonData.fromList(backButtonDataList)
    }
    let leadingNavigationBarButtonsData: [FCPBarButtonData?]? = nilOrValue(list[1])
    let trailingNavigationBarButtonsData: [FCPBarButtonData?]? = nilOrValue(list[2])

    return FCPBarButtonProvidingData(
      backButtonData: backButtonData,
      leadingNavigationBarButtonsData: leadingNavigationBarButtonsData,
      trailingNavigationBarButtonsData: trailingNavigationBarButtonsData
    )
  }
  func toList() -> [Any?] {
    return [
      backButtonData?.toList(),
      leadingNavigationBarButtonsData,
      trailingNavigationBarButtonsData,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPBarButtonData {
  var objectData: FCPComponentData
  var image: FCPImageData? = nil
  var title: String? = nil

  static func fromList(_ list: [Any?]) -> FCPBarButtonData? {
    let objectData = FCPComponentData.fromList(list[0] as! [Any?])!
    var image: FCPImageData? = nil
    if let imageList: [Any?] = nilOrValue(list[1]) {
      image = FCPImageData.fromList(imageList)
    }
    let title: String? = nilOrValue(list[2])

    return FCPBarButtonData(
      objectData: objectData,
      image: image,
      title: title
    )
  }
  func toList() -> [Any?] {
    return [
      objectData.toList(),
      image?.toList(),
      title,
    ]
  }
}
private class TemplateHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 128:
      return FCPBarButtonData.fromList(self.readValue() as! [Any?])
    case 129:
      return FCPBarButtonData.fromList(self.readValue() as! [Any?])
    case 130:
      return FCPBarButtonProvidingData.fromList(self.readValue() as! [Any?])
    case 131:
      return FCPComponentData.fromList(self.readValue() as! [Any?])
    case 132:
      return FCPImageData.fromList(self.readValue() as! [Any?])
    case 133:
      return FCPListTemplateData.fromList(self.readValue() as! [Any?])
    case 134:
      return FCPSystemImageData.fromList(self.readValue() as! [Any?])
    case 135:
      return FCPTabBarTemplateData.fromList(self.readValue() as! [Any?])
    case 136:
      return FCPTabData.fromList(self.readValue() as! [Any?])
    case 137:
      return FCPTemplateData.fromList(self.readValue() as! [Any?])
    case 138:
      return WrappedTemplateData.fromList(self.readValue() as! [Any?])
    case 139:
      return WrappedTemplateData.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class TemplateHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? FCPBarButtonData {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? FCPBarButtonData {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? FCPBarButtonProvidingData {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else if let value = value as? FCPComponentData {
      super.writeByte(131)
      super.writeValue(value.toList())
    } else if let value = value as? FCPImageData {
      super.writeByte(132)
      super.writeValue(value.toList())
    } else if let value = value as? FCPListTemplateData {
      super.writeByte(133)
      super.writeValue(value.toList())
    } else if let value = value as? FCPSystemImageData {
      super.writeByte(134)
      super.writeValue(value.toList())
    } else if let value = value as? FCPTabBarTemplateData {
      super.writeByte(135)
      super.writeValue(value.toList())
    } else if let value = value as? FCPTabData {
      super.writeByte(136)
      super.writeValue(value.toList())
    } else if let value = value as? FCPTemplateData {
      super.writeByte(137)
      super.writeValue(value.toList())
    } else if let value = value as? WrappedTemplateData {
      super.writeByte(138)
      super.writeValue(value.toList())
    } else if let value = value as? WrappedTemplateData {
      super.writeByte(139)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class TemplateHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return TemplateHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return TemplateHostApiCodecWriter(data: data)
  }
}

class TemplateHostApiCodec: FlutterStandardMessageCodec {
  static let shared = TemplateHostApiCodec(readerWriter: TemplateHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol TemplateHostApi {
  func pushTemplate(wrappedTemplateData: WrappedTemplateData, animated: Bool, asRoot: Bool) throws
  func updateTabBarChildTemplates(tabBarTemplateId: String, templates: [WrappedTemplateData?]) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class TemplateHostApiSetup {
  /// The codec used by TemplateHostApi.
  static var codec: FlutterStandardMessageCodec { TemplateHostApiCodec.shared }
  /// Sets up an instance of `TemplateHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: TemplateHostApi?) {
    let pushTemplateChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.flutter_carplay_plus.TemplateHostApi.pushTemplate", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      pushTemplateChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let wrappedTemplateDataArg = args[0] as! WrappedTemplateData
        let animatedArg = args[1] as! Bool
        let asRootArg = args[2] as! Bool
        do {
          try api.pushTemplate(wrappedTemplateData: wrappedTemplateDataArg, animated: animatedArg, asRoot: asRootArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      pushTemplateChannel.setMessageHandler(nil)
    }
    let updateTabBarChildTemplatesChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.flutter_carplay_plus.TemplateHostApi.updateTabBarChildTemplates", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      updateTabBarChildTemplatesChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let tabBarTemplateIdArg = args[0] as! String
        let templatesArg = args[1] as! [WrappedTemplateData?]
        do {
          try api.updateTabBarChildTemplates(tabBarTemplateId: tabBarTemplateIdArg, templates: templatesArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      updateTabBarChildTemplatesChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol TemplateFlutterApiProtocol {
  func onActionCompletion(objectId objectIdArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void)
  func onTabSelected(tabBarTemplateId tabBarTemplateIdArg: String, selectedTemplateId selectedTemplateIdArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void)
}
class TemplateFlutterApi: TemplateFlutterApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger) {
    self.binaryMessenger = binaryMessenger
  }
  func onActionCompletion(objectId objectIdArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onActionCompletion"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([objectIdArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
  func onTabSelected(tabBarTemplateId tabBarTemplateIdArg: String, selectedTemplateId selectedTemplateIdArg: String, completion: @escaping (Result<Void, FlutterError>) -> Void) {
    let channelName: String = "dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onTabSelected"
    let channel = FlutterBasicMessageChannel(name: channelName, binaryMessenger: binaryMessenger)
    channel.sendMessage([tabBarTemplateIdArg, selectedTemplateIdArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(createConnectionError(withChannelName: channelName)))
        return
      }
      if listResponse.count > 1 {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)))
      } else {
        completion(.success(Void()))
      }
    }
  }
}
