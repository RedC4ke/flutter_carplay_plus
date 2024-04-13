import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/other/fcp_clickable_component.dart';

/// A button that appears in the navigation bar.
class FCPBarButton extends FCPClickableComponent {
  /// Creates a new instance of [FCPBarButton].
  FCPBarButton({
    required this.title,
    this.style = FCPBarButtonStyle.rounded,
    this.type = FCPBarButtonType.text,
    this.isEnabled = true,
    super.onPress,
  });

  /// The title displayed on the bar button.
  final String title;

  /// The style to use when displaying the button.
  /// Default is [FCPBarButtonStyle.rounded]
  final FCPBarButtonStyle style;

  final FCPBarButtonType type;

  final bool isEnabled;

  @override
  FCPBarButtonData get serializedData {
    return FCPBarButtonData(
      componentData: componentData,
      title: title,
      style: style,
      type: type,
      isEnabled: isEnabled,
    );
  }
}
