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

class FCPObjectData {
  FCPObjectData({
    required this.objectId,
  });

  final String objectId;
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
  });

  final String? tabTitle;
  final FCPImageData? tabImage;
  final FCPSystemImageData? tabSystemImage;
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

class FCPFullscreenTemplateData {
  FCPFullscreenTemplateData({
    required this.objectData,
    required this.tabData,
  });

  final FCPObjectData objectData;
  final FCPTabData? tabData;
}

class FCPModalTemplateData {
  FCPModalTemplateData({
    required this.objectData,
  });

  final FCPObjectData objectData;
}

class FCPTabBarTemplateData {
  FCPTabBarTemplateData({
    required this.templateData,
    required this.templates,
  });

  final FCPFullscreenTemplateData templateData;
  final List<WrappedTemplateData?> templates;
}

class FCPListTemplateData {
  FCPListTemplateData({
    required this.templateData,
    this.barButtonProvidingData,
  });

  final FCPFullscreenTemplateData templateData;
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

  final FCPObjectData objectData;
  final FCPImageData? image;
  final String? title;
}
