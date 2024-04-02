import 'package:flutter_carplay_plus/ui/models/other/fcp_clickable_component.dart';

/// The style to use when displaying a bar button.
enum FCPBarButtonStyles {
  /// No styling is applied.
  none,

  /// A rounded style is applied.
  rounded,
}

/// A button that appears in the navigation bar.
class FCPBarButton extends FCPClickableComponent {
  /// Creates a new instance of [FCPBarButton].
  FCPBarButton({
    required this.title,
    this.style = FCPBarButtonStyles.rounded,
    super.onPress,
  });

  /// The title displayed on the bar button.
  final String title;

  /// The style to use when displaying the button.
  /// Default is [FCPBarButtonStyles.rounded]
  final FCPBarButtonStyles style;
}
