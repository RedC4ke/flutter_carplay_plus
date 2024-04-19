import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/buttons/fcp_bar_button.dart';
import 'package:flutter_carplay_plus/ui/models/fcp_component.dart';

/// A superclass for all templates.
abstract base class FCPTemplate extends FCPComponent {
  /// Generated data model for [TemplateHostApi]
  @override
  WrappedTemplateData get serializedData;
}

/// A superclass for templates that are presented fullscreen.
abstract base class FCPFullscreenTemplate extends FCPTemplate {
  /// Creates a new instance of [FCPFullscreenTemplate].
  FCPFullscreenTemplate({
    required this.tabData,
  });

  /// Information to be displayed when the template is
  /// presented as a tab in a tab bar.
  final FCPTabData? tabData;
}

/// A superclass for templates that are presented modally.
abstract base class FCPModalTemplate extends FCPTemplate {}

/// A mixin for templates that can be used as root.
base mixin FCPRootTemplate on FCPTemplate {}

/// Represents template's ability to provide navigation bar buttons.
base mixin FCPBarButtonProviding on FCPTemplate {
  /// A button that appears in the navigation bar that navigates back.
  abstract final FCPBarButton? backButton;

  /// A set of buttons that appear in the navigation bar leading area.
  abstract final List<FCPBarButton>? leadingNavigationBarButtons;

  /// A set of buttons that appear in the navigation bar trailing area.
  abstract final List<FCPBarButton>? trailingNavigationBarButtons;

  /// A getter for [FCPBarButtonProvidingData].
  FCPBarButtonProvidingData get barButtonProvidingData {
    return FCPBarButtonProvidingData(
      backButtonData: backButton?.serializedData,
      leadingNavigationBarButtonsData:
          leadingNavigationBarButtons?.map((e) => e.serializedData).toList(),
      trailingNavigationBarButtonsData:
          trailingNavigationBarButtons?.map((e) => e.serializedData).toList(),
    );
  }
}
