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
  //* Updates
  void updateTabBarChildTemplates({
    required String tabBarTemplateId,
    required List<WrappedTemplateData?> templates,
  });
}

@FlutterApi()
abstract class TemplateFlutterApi {
  void onActionCompletion(
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
    this.tabSystemImage,
    this.showsTabBadge = false,
  });

  final String? tabTitle;
  final FCPImageData? tabImage;
  final FCPSystemImageData? tabSystemImage;
  final bool showsTabBadge;
}

enum FCPTemplateType {
  list,
  modal,
  tabBar,
}

class WrappedTemplateData {
  WrappedTemplateData({
    required this.type,
    this.listTemplateData,
    this.tabBarTemplateData,
  });

  final FCPTemplateType type;
  final FCPListTemplateData? listTemplateData;
  final FCPTabBarTemplateData? tabBarTemplateData;
}

//! Templates

enum FCPTemplateCategory {
  fullscreen,
  modal,
}

class FCPTemplateData {
  FCPTemplateData({
    required this.objectData,
    required this.category,
    this.tabData,
  });

  final FCPComponentData objectData;
  final FCPTabData? tabData;
  final FCPTemplateCategory category;
}

class FCPTabBarTemplateData {
  FCPTabBarTemplateData({
    required this.templateData,
    required this.templates,
  });

  final FCPTemplateData templateData;
  final List<WrappedTemplateData?> templates;
}

class FCPListTemplateData {
  FCPListTemplateData({
    required this.templateData,
    this.barButtonProvidingData,
  });

  final FCPTemplateData templateData;
  final FCPBarButtonProvidingData? barButtonProvidingData;
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

class FCPBarButtonData {
  FCPBarButtonData({
    required this.objectData,
    this.image,
    this.title,
  });

  final FCPComponentData objectData;
  final FCPImageData? image;
  final String? title;
}
