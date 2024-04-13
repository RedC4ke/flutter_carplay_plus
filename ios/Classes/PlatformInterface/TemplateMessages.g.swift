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

enum FCPListTemplateItemType: Int {
  case listItem = 0
  case imageRowListItem = 1
  case messageListItem = 2
}

enum FCPListItemAccessoryType: Int {
  case none = 0
  case disclosureIndicator = 1
  case detailButton = 2
}

enum FCPListItemPlayingIndicatorLocation: Int {
  case leading = 0
  case trailing = 1
}

enum FCPMessageLeadingItem: Int {
  case none = 0
  case pin = 1
  case star = 2
}

enum FCPMessageTrailingItem: Int {
  case none = 0
  case mute = 1
}

enum FCPBarButtonStyle: Int {
  case none = 0
  case rounded = 1
}

enum FCPBarButtonType: Int {
  case text = 0
  case image = 1
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
struct FCPTabData {
  var tabTitle: String? = nil
  var tabImage: FCPImageData? = nil
  var showsTabBadge: Bool

  static func fromList(_ list: [Any?]) -> FCPTabData? {
    let tabTitle: String? = nilOrValue(list[0])
    var tabImage: FCPImageData? = nil
    if let tabImageList: [Any?] = nilOrValue(list[1]) {
      tabImage = FCPImageData.fromList(tabImageList)
    }
    let showsTabBadge = list[2] as! Bool

    return FCPTabData(
      tabTitle: tabTitle,
      tabImage: tabImage,
      showsTabBadge: showsTabBadge
    )
  }
  func toList() -> [Any?] {
    return [
      tabTitle,
      tabImage?.toList(),
      showsTabBadge,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct WrappedTemplateData {
  var type: FCPTemplateType
  var data: FCPTemplateData
  var listTemplateData: FCPListTemplateData? = nil
  var tabBarTemplateData: FCPTabBarTemplateData? = nil

  static func fromList(_ list: [Any?]) -> WrappedTemplateData? {
    let type = FCPTemplateType(rawValue: list[0] as! Int)!
    let data = FCPTemplateData.fromList(list[1] as! [Any?])!
    var listTemplateData: FCPListTemplateData? = nil
    if let listTemplateDataList: [Any?] = nilOrValue(list[2]) {
      listTemplateData = FCPListTemplateData.fromList(listTemplateDataList)
    }
    var tabBarTemplateData: FCPTabBarTemplateData? = nil
    if let tabBarTemplateDataList: [Any?] = nilOrValue(list[3]) {
      tabBarTemplateData = FCPTabBarTemplateData.fromList(tabBarTemplateDataList)
    }

    return WrappedTemplateData(
      type: type,
      data: data,
      listTemplateData: listTemplateData,
      tabBarTemplateData: tabBarTemplateData
    )
  }
  func toList() -> [Any?] {
    return [
      type.rawValue,
      data.toList(),
      listTemplateData?.toList(),
      tabBarTemplateData?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPTemplateData {
  var componentData: FCPComponentData
  var tabData: FCPTabData? = nil
  var category: FCPTemplateCategory

  static func fromList(_ list: [Any?]) -> FCPTemplateData? {
    let componentData = FCPComponentData.fromList(list[0] as! [Any?])!
    var tabData: FCPTabData? = nil
    if let tabDataList: [Any?] = nilOrValue(list[1]) {
      tabData = FCPTabData.fromList(tabDataList)
    }
    let category = FCPTemplateCategory(rawValue: list[2] as! Int)!

    return FCPTemplateData(
      componentData: componentData,
      tabData: tabData,
      category: category
    )
  }
  func toList() -> [Any?] {
    return [
      componentData.toList(),
      tabData?.toList(),
      category.rawValue,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPTabBarTemplateData {
  var templates: [WrappedTemplateData?]

  static func fromList(_ list: [Any?]) -> FCPTabBarTemplateData? {
    let templates = list[0] as! [WrappedTemplateData?]

    return FCPTabBarTemplateData(
      templates: templates
    )
  }
  func toList() -> [Any?] {
    return [
      templates
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPListTemplateData {
  var barButtonProvidingData: FCPBarButtonProvidingData? = nil
  var sections: [FCPListSectionData?]
  var emptyViewTitleVariants: [String?]
  var emptyViewSubtitleVariants: [String?]
  var title: String? = nil

  static func fromList(_ list: [Any?]) -> FCPListTemplateData? {
    var barButtonProvidingData: FCPBarButtonProvidingData? = nil
    if let barButtonProvidingDataList: [Any?] = nilOrValue(list[0]) {
      barButtonProvidingData = FCPBarButtonProvidingData.fromList(barButtonProvidingDataList)
    }
    let sections = list[1] as! [FCPListSectionData?]
    let emptyViewTitleVariants = list[2] as! [String?]
    let emptyViewSubtitleVariants = list[3] as! [String?]
    let title: String? = nilOrValue(list[4])

    return FCPListTemplateData(
      barButtonProvidingData: barButtonProvidingData,
      sections: sections,
      emptyViewTitleVariants: emptyViewTitleVariants,
      emptyViewSubtitleVariants: emptyViewSubtitleVariants,
      title: title
    )
  }
  func toList() -> [Any?] {
    return [
      barButtonProvidingData?.toList(),
      sections,
      emptyViewTitleVariants,
      emptyViewSubtitleVariants,
      title,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPListSectionData {
  var header: String? = nil
  var sectionIndexTitle: String? = nil
  var items: [WrappedListItemData?]
  var headerButton: FCPButtonData? = nil
  var headerImage: FCPImageData? = nil
  var headerSubtitle: String? = nil

  static func fromList(_ list: [Any?]) -> FCPListSectionData? {
    let header: String? = nilOrValue(list[0])
    let sectionIndexTitle: String? = nilOrValue(list[1])
    let items = list[2] as! [WrappedListItemData?]
    var headerButton: FCPButtonData? = nil
    if let headerButtonList: [Any?] = nilOrValue(list[3]) {
      headerButton = FCPButtonData.fromList(headerButtonList)
    }
    var headerImage: FCPImageData? = nil
    if let headerImageList: [Any?] = nilOrValue(list[4]) {
      headerImage = FCPImageData.fromList(headerImageList)
    }
    let headerSubtitle: String? = nilOrValue(list[5])

    return FCPListSectionData(
      header: header,
      sectionIndexTitle: sectionIndexTitle,
      items: items,
      headerButton: headerButton,
      headerImage: headerImage,
      headerSubtitle: headerSubtitle
    )
  }
  func toList() -> [Any?] {
    return [
      header,
      sectionIndexTitle,
      items,
      headerButton?.toList(),
      headerImage?.toList(),
      headerSubtitle,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPListItemData {
  var accessoryType: FCPListItemAccessoryType
  var accessoryImage: FCPImageData? = nil
  var detailText: String? = nil
  var image: FCPImageData? = nil
  var isExplicitContent: Bool
  var isPlaying: Bool
  var playingIndicatorLocation: FCPListItemPlayingIndicatorLocation
  var playbackProgress: Double

  static func fromList(_ list: [Any?]) -> FCPListItemData? {
    let accessoryType = FCPListItemAccessoryType(rawValue: list[0] as! Int)!
    var accessoryImage: FCPImageData? = nil
    if let accessoryImageList: [Any?] = nilOrValue(list[1]) {
      accessoryImage = FCPImageData.fromList(accessoryImageList)
    }
    let detailText: String? = nilOrValue(list[2])
    var image: FCPImageData? = nil
    if let imageList: [Any?] = nilOrValue(list[3]) {
      image = FCPImageData.fromList(imageList)
    }
    let isExplicitContent = list[4] as! Bool
    let isPlaying = list[5] as! Bool
    let playingIndicatorLocation = FCPListItemPlayingIndicatorLocation(rawValue: list[6] as! Int)!
    let playbackProgress = list[7] as! Double

    return FCPListItemData(
      accessoryType: accessoryType,
      accessoryImage: accessoryImage,
      detailText: detailText,
      image: image,
      isExplicitContent: isExplicitContent,
      isPlaying: isPlaying,
      playingIndicatorLocation: playingIndicatorLocation,
      playbackProgress: playbackProgress
    )
  }
  func toList() -> [Any?] {
    return [
      accessoryType.rawValue,
      accessoryImage?.toList(),
      detailText,
      image?.toList(),
      isExplicitContent,
      isPlaying,
      playingIndicatorLocation.rawValue,
      playbackProgress,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPListImageRowItemData {
  var gridImages: [FCPImageData?]
  var imageTitles: [String?]

  static func fromList(_ list: [Any?]) -> FCPListImageRowItemData? {
    let gridImages = list[0] as! [FCPImageData?]
    let imageTitles = list[1] as! [String?]

    return FCPListImageRowItemData(
      gridImages: gridImages,
      imageTitles: imageTitles
    )
  }
  func toList() -> [Any?] {
    return [
      gridImages,
      imageTitles,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPMessageListItemLeadingConfigurationData {
  var leadingItem: FCPMessageLeadingItem? = nil
  var leadingImage: FCPImageData? = nil
  var isUnread: Bool

  static func fromList(_ list: [Any?]) -> FCPMessageListItemLeadingConfigurationData? {
    var leadingItem: FCPMessageLeadingItem? = nil
    let leadingItemEnumVal: Int? = nilOrValue(list[0])
    if let leadingItemRawValue = leadingItemEnumVal {
      leadingItem = FCPMessageLeadingItem(rawValue: leadingItemRawValue)!
    }
    var leadingImage: FCPImageData? = nil
    if let leadingImageList: [Any?] = nilOrValue(list[1]) {
      leadingImage = FCPImageData.fromList(leadingImageList)
    }
    let isUnread = list[2] as! Bool

    return FCPMessageListItemLeadingConfigurationData(
      leadingItem: leadingItem,
      leadingImage: leadingImage,
      isUnread: isUnread
    )
  }
  func toList() -> [Any?] {
    return [
      leadingItem?.rawValue,
      leadingImage?.toList(),
      isUnread,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPMessageListItemTrailingConfigurationData {
  var trailingItem: FCPMessageTrailingItem
  var trailingImage: FCPImageData? = nil

  static func fromList(_ list: [Any?]) -> FCPMessageListItemTrailingConfigurationData? {
    let trailingItem = FCPMessageTrailingItem(rawValue: list[0] as! Int)!
    var trailingImage: FCPImageData? = nil
    if let trailingImageList: [Any?] = nilOrValue(list[1]) {
      trailingImage = FCPImageData.fromList(trailingImageList)
    }

    return FCPMessageListItemTrailingConfigurationData(
      trailingItem: trailingItem,
      trailingImage: trailingImage
    )
  }
  func toList() -> [Any?] {
    return [
      trailingItem.rawValue,
      trailingImage?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPListMessageItemData {
  var conversationIdentifier: String? = nil
  var phoneOrEmailAddress: String? = nil
  var detailText: String? = nil
  var trailingText: String? = nil
  var leadingConfiguration: FCPMessageListItemLeadingConfigurationData? = nil
  var trailingConfiguration: FCPMessageListItemTrailingConfigurationData? = nil

  static func fromList(_ list: [Any?]) -> FCPListMessageItemData? {
    let conversationIdentifier: String? = nilOrValue(list[0])
    let phoneOrEmailAddress: String? = nilOrValue(list[1])
    let detailText: String? = nilOrValue(list[2])
    let trailingText: String? = nilOrValue(list[3])
    var leadingConfiguration: FCPMessageListItemLeadingConfigurationData? = nil
    if let leadingConfigurationList: [Any?] = nilOrValue(list[4]) {
      leadingConfiguration = FCPMessageListItemLeadingConfigurationData.fromList(leadingConfigurationList)
    }
    var trailingConfiguration: FCPMessageListItemTrailingConfigurationData? = nil
    if let trailingConfigurationList: [Any?] = nilOrValue(list[5]) {
      trailingConfiguration = FCPMessageListItemTrailingConfigurationData.fromList(trailingConfigurationList)
    }

    return FCPListMessageItemData(
      conversationIdentifier: conversationIdentifier,
      phoneOrEmailAddress: phoneOrEmailAddress,
      detailText: detailText,
      trailingText: trailingText,
      leadingConfiguration: leadingConfiguration,
      trailingConfiguration: trailingConfiguration
    )
  }
  func toList() -> [Any?] {
    return [
      conversationIdentifier,
      phoneOrEmailAddress,
      detailText,
      trailingText,
      leadingConfiguration?.toList(),
      trailingConfiguration?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct WrappedListItemData {
  var componentData: FCPComponentData
  var type: FCPListTemplateItemType
  var text: String? = nil
  var isEnabled: Bool
  var listItemData: FCPListItemData? = nil
  var imageRowItemData: FCPListImageRowItemData? = nil
  var messageItemData: FCPListMessageItemData? = nil

  static func fromList(_ list: [Any?]) -> WrappedListItemData? {
    let componentData = FCPComponentData.fromList(list[0] as! [Any?])!
    let type = FCPListTemplateItemType(rawValue: list[1] as! Int)!
    let text: String? = nilOrValue(list[2])
    let isEnabled = list[3] as! Bool
    var listItemData: FCPListItemData? = nil
    if let listItemDataList: [Any?] = nilOrValue(list[4]) {
      listItemData = FCPListItemData.fromList(listItemDataList)
    }
    var imageRowItemData: FCPListImageRowItemData? = nil
    if let imageRowItemDataList: [Any?] = nilOrValue(list[5]) {
      imageRowItemData = FCPListImageRowItemData.fromList(imageRowItemDataList)
    }
    var messageItemData: FCPListMessageItemData? = nil
    if let messageItemDataList: [Any?] = nilOrValue(list[6]) {
      messageItemData = FCPListMessageItemData.fromList(messageItemDataList)
    }

    return WrappedListItemData(
      componentData: componentData,
      type: type,
      text: text,
      isEnabled: isEnabled,
      listItemData: listItemData,
      imageRowItemData: imageRowItemData,
      messageItemData: messageItemData
    )
  }
  func toList() -> [Any?] {
    return [
      componentData.toList(),
      type.rawValue,
      text,
      isEnabled,
      listItemData?.toList(),
      imageRowItemData?.toList(),
      messageItemData?.toList(),
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
  var componentData: FCPComponentData
  var image: FCPImageData? = nil
  var title: String? = nil
  var style: FCPBarButtonStyle
  var type: FCPBarButtonType
  var isEnabled: Bool

  static func fromList(_ list: [Any?]) -> FCPBarButtonData? {
    let componentData = FCPComponentData.fromList(list[0] as! [Any?])!
    var image: FCPImageData? = nil
    if let imageList: [Any?] = nilOrValue(list[1]) {
      image = FCPImageData.fromList(imageList)
    }
    let title: String? = nilOrValue(list[2])
    let style = FCPBarButtonStyle(rawValue: list[3] as! Int)!
    let type = FCPBarButtonType(rawValue: list[4] as! Int)!
    let isEnabled = list[5] as! Bool

    return FCPBarButtonData(
      componentData: componentData,
      image: image,
      title: title,
      style: style,
      type: type,
      isEnabled: isEnabled
    )
  }
  func toList() -> [Any?] {
    return [
      componentData.toList(),
      image?.toList(),
      title,
      style.rawValue,
      type.rawValue,
      isEnabled,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct FCPButtonData {
  var componentData: FCPComponentData
  var image: FCPImageData? = nil
  var title: String? = nil
  var isEnabled: Bool

  static func fromList(_ list: [Any?]) -> FCPButtonData? {
    let componentData = FCPComponentData.fromList(list[0] as! [Any?])!
    var image: FCPImageData? = nil
    if let imageList: [Any?] = nilOrValue(list[1]) {
      image = FCPImageData.fromList(imageList)
    }
    let title: String? = nilOrValue(list[2])
    let isEnabled = list[3] as! Bool

    return FCPButtonData(
      componentData: componentData,
      image: image,
      title: title,
      isEnabled: isEnabled
    )
  }
  func toList() -> [Any?] {
    return [
      componentData.toList(),
      image?.toList(),
      title,
      isEnabled,
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
      return FCPButtonData.fromList(self.readValue() as! [Any?])
    case 132:
      return FCPComponentData.fromList(self.readValue() as! [Any?])
    case 133:
      return FCPImageData.fromList(self.readValue() as! [Any?])
    case 134:
      return FCPImageData.fromList(self.readValue() as! [Any?])
    case 135:
      return FCPListImageRowItemData.fromList(self.readValue() as! [Any?])
    case 136:
      return FCPListItemData.fromList(self.readValue() as! [Any?])
    case 137:
      return FCPListMessageItemData.fromList(self.readValue() as! [Any?])
    case 138:
      return FCPListSectionData.fromList(self.readValue() as! [Any?])
    case 139:
      return FCPListTemplateData.fromList(self.readValue() as! [Any?])
    case 140:
      return FCPMessageListItemLeadingConfigurationData.fromList(self.readValue() as! [Any?])
    case 141:
      return FCPMessageListItemTrailingConfigurationData.fromList(self.readValue() as! [Any?])
    case 142:
      return FCPTabBarTemplateData.fromList(self.readValue() as! [Any?])
    case 143:
      return FCPTabData.fromList(self.readValue() as! [Any?])
    case 144:
      return FCPTemplateData.fromList(self.readValue() as! [Any?])
    case 145:
      return WrappedListItemData.fromList(self.readValue() as! [Any?])
    case 146:
      return WrappedTemplateData.fromList(self.readValue() as! [Any?])
    case 147:
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
    } else if let value = value as? FCPButtonData {
      super.writeByte(131)
      super.writeValue(value.toList())
    } else if let value = value as? FCPComponentData {
      super.writeByte(132)
      super.writeValue(value.toList())
    } else if let value = value as? FCPImageData {
      super.writeByte(133)
      super.writeValue(value.toList())
    } else if let value = value as? FCPImageData {
      super.writeByte(134)
      super.writeValue(value.toList())
    } else if let value = value as? FCPListImageRowItemData {
      super.writeByte(135)
      super.writeValue(value.toList())
    } else if let value = value as? FCPListItemData {
      super.writeByte(136)
      super.writeValue(value.toList())
    } else if let value = value as? FCPListMessageItemData {
      super.writeByte(137)
      super.writeValue(value.toList())
    } else if let value = value as? FCPListSectionData {
      super.writeByte(138)
      super.writeValue(value.toList())
    } else if let value = value as? FCPListTemplateData {
      super.writeByte(139)
      super.writeValue(value.toList())
    } else if let value = value as? FCPMessageListItemLeadingConfigurationData {
      super.writeByte(140)
      super.writeValue(value.toList())
    } else if let value = value as? FCPMessageListItemTrailingConfigurationData {
      super.writeByte(141)
      super.writeValue(value.toList())
    } else if let value = value as? FCPTabBarTemplateData {
      super.writeByte(142)
      super.writeValue(value.toList())
    } else if let value = value as? FCPTabData {
      super.writeByte(143)
      super.writeValue(value.toList())
    } else if let value = value as? FCPTemplateData {
      super.writeByte(144)
      super.writeValue(value.toList())
    } else if let value = value as? WrappedListItemData {
      super.writeByte(145)
      super.writeValue(value.toList())
    } else if let value = value as? WrappedTemplateData {
      super.writeByte(146)
      super.writeValue(value.toList())
    } else if let value = value as? WrappedTemplateData {
      super.writeByte(147)
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
