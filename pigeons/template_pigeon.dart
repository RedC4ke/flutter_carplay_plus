import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/platform_interface/template/template_messages.g.dart',
    dartOptions: DartOptions(),
    swiftOut: 'ios/Classes/PlatformInterface/TemplateMessages.g.swift',
    swiftOptions: SwiftOptions(),
    dartPackageName: 'flutter_carplay_plus',
  ),
)
@HostApi()
abstract class TemplateHostApi {
  //* Navigation
  void pushTemplate({
    required WrappedTemplateData wrappedTemplateData,
    bool animated = true,
    bool asRoot = false,
  });
  void presentTemplate({
    required WrappedTemplateData wrappedTemplateData,
    bool animated = true,
  });
  void dismissTemplate({
    bool animated = true,
  });
  void popTemplate({
    bool animated = true,
  });
  void popToRootTemplate({
    bool animated = true,
  });
  //* Updates
  void updateTabBarChildTemplates({
    required String tabBarTemplateId,
    required List<WrappedTemplateData?> templates,
  });
  //* Callbacks
  void interactionCompleted(
    String objectId,
  );
}

@FlutterApi()
abstract class TemplateFlutterApi {
  void interactionStarted(
    String objectId,
  );
  void onTabSelected(
    String tabBarTemplateId,
    String selectedTemplateId,
  );
}

class FCPComponentData {
  FCPComponentData({
    required this.componentId,
  });

  final String componentId;
}

enum FCPImageSource {
  network,
  file,
  asset,
  system,
}

class FCPImageData {
  FCPImageData({
    required this.source,
    required this.path,
  });

  final FCPImageSource source;
  final String path;
}

class FCPSystemImageData {
  FCPSystemImageData({
    required this.symbolIdentifier,
  });

  final String symbolIdentifier;
}

class FCPTabData {
  FCPTabData({
    this.tabTitle,
    this.tabImage,
    this.showsTabBadge = false,
  });

  final String? tabTitle;
  final FCPImageData? tabImage;
  final bool showsTabBadge;

  // TODO(Redc4ke): Add system item data
}

enum FCPTemplateType {
  list,
  tabBar,
}

class WrappedTemplateData {
  WrappedTemplateData({
    required this.type,
    required this.data,
    this.listTemplateData,
    this.tabBarTemplateData,
  });

  final FCPTemplateType type;
  final FCPTemplateData data;
  final FCPListTemplateData? listTemplateData;
  final FCPTabBarTemplateData? tabBarTemplateData;
}

//! Templates
class FCPTemplateData {
  FCPTemplateData({
    required this.componentData,
    this.tabData,
  });

  final FCPComponentData componentData;
  final FCPTabData? tabData;
}

class FCPTabBarTemplateData {
  FCPTabBarTemplateData({
    required this.templates,
  });

  final List<WrappedTemplateData?> templates;
}

//* List template

class FCPListTemplateData {
  FCPListTemplateData({
    required this.sections,
    this.barButtonProvidingData,
    this.emptyViewTitleVariants = const [],
    this.emptyViewSubtitleVariants = const [],
    this.title,
  });

  final FCPBarButtonProvidingData? barButtonProvidingData;
  final List<FCPListSectionData?> sections;
  final List<String?> emptyViewTitleVariants;
  final List<String?> emptyViewSubtitleVariants;
  final String? title;

  // TODO(Redc4ke): Add assistant related props
}

class FCPListSectionData {
  FCPListSectionData({
    required this.items,
    this.header,
    this.sectionIndexTitle,
    this.headerButton,
    this.headerImage,
    this.headerSubtitle,
  });

  final String? header;
  final String? sectionIndexTitle;
  final List<WrappedListItemData?> items;
  final FCPButtonData? headerButton;
  final FCPImageData? headerImage;
  final String? headerSubtitle;
}

enum FCPListTemplateItemType {
  listItem,
  imageRowListItem,
  messageListItem,
}

enum FCPListItemAccessoryType {
  none,
  disclosureIndicator,
  cloud,
}

enum FCPListItemPlayingIndicatorLocation {
  leading,
  trailing,
}

class FCPListTemplateItemData {
  FCPListTemplateItemData({
    required this.componentData,
    this.text,
    this.isEnabled = true,
  });

  final FCPComponentData componentData;
  final String? text;
  final bool isEnabled;
}

class FCPListItemData {
  FCPListItemData({
    required this.accessoryType,
    this.accessoryImage,
    this.detailText,
    this.image,
    this.isExplicitContent = false,
    this.isPlaying = false,
    this.playingIndicatorLocation =
        FCPListItemPlayingIndicatorLocation.trailing,
    this.playbackProgress = 0,
  });

  final FCPListItemAccessoryType accessoryType;
  final FCPImageData? accessoryImage;
  final String? detailText;
  final FCPImageData? image;
  final bool isExplicitContent;
  final bool isPlaying;
  final FCPListItemPlayingIndicatorLocation playingIndicatorLocation;
  final double playbackProgress;

  // TODO(Redc4ke): Add assistant related props
}

class FCPListImageRowItemData {
  FCPListImageRowItemData({
    required this.gridImages,
    required this.imageTitles,
  });

  final List<FCPImageData?> gridImages;
  final List<String?> imageTitles;
}

enum FCPMessageLeadingItem {
  none,
  pin,
  star,
}

class FCPMessageListItemLeadingConfigurationData {
  FCPMessageListItemLeadingConfigurationData({
    required this.leadingImage,
    this.leadingItem = FCPMessageLeadingItem.none,
    this.isUnread = false,
  });

  final FCPMessageLeadingItem? leadingItem;
  final FCPImageData? leadingImage;
  final bool isUnread;
}

enum FCPMessageTrailingItem {
  none,
  mute,
}

class FCPMessageListItemTrailingConfigurationData {
  FCPMessageListItemTrailingConfigurationData({
    this.trailingItem = FCPMessageTrailingItem.none,
    this.trailingImage,
  });

  final FCPMessageTrailingItem trailingItem;
  final FCPImageData? trailingImage;
}

class FCPListMessageItemData {
  FCPListMessageItemData({
    this.conversationIdentifier,
    this.phoneOrEmailAddress,
    this.detailText,
    this.trailingText,
    this.leadingConfiguration,
    this.trailingConfiguration,
  });

  final String? conversationIdentifier;
  final String? phoneOrEmailAddress;
  final String? detailText;
  final String? trailingText;
  final FCPMessageListItemLeadingConfigurationData? leadingConfiguration;
  final FCPMessageListItemTrailingConfigurationData? trailingConfiguration;
}

class WrappedListItemData {
  WrappedListItemData({
    required this.type,
    required this.itemData,
    this.listItemData,
    this.imageRowItemData,
    this.messageItemData,
  });

  final FCPListTemplateItemType type;
  final FCPListTemplateItemData itemData;

  final FCPListItemData? listItemData;
  final FCPListImageRowItemData? imageRowItemData;
  final FCPListMessageItemData? messageItemData;
}

//! Buttons

class FCPBarButtonProvidingData {
  FCPBarButtonProvidingData({
    this.backButtonData,
    this.leadingNavigationBarButtonsData,
    this.trailingNavigationBarButtonsData,
  });

  final FCPBarButtonData? backButtonData;
  final List<FCPBarButtonData?>? leadingNavigationBarButtonsData;
  final List<FCPBarButtonData?>? trailingNavigationBarButtonsData;
}

enum FCPBarButtonStyle {
  none,
  rounded,
}

enum FCPBarButtonType {
  text,
  image,
}

class FCPBarButtonData {
  FCPBarButtonData({
    required this.componentData,
    this.image,
    this.title,
    this.style = FCPBarButtonStyle.rounded,
    this.type = FCPBarButtonType.text,
    this.isEnabled = true,
  });

  final FCPComponentData componentData;
  final FCPImageData? image;
  final String? title;
  final FCPBarButtonStyle style;
  final FCPBarButtonType type;
  final bool isEnabled;
}

class FCPButtonData {
  FCPButtonData({
    required this.componentData,
    this.image,
    this.title,
    this.isEnabled = true,
  });

  final FCPComponentData componentData;
  final FCPImageData? image;
  final String? title;
  final bool isEnabled;
}
