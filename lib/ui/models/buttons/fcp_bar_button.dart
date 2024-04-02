/// The style to use when displaying a bar button.
enum FCPBarButtonStyles {
  /// No styling is applied.
  none,

  /// A rounded style is applied.
  rounded,
}

/// A button that appears in the navigation bar.
class FCPBarButton {
  /// Creates a new instance of [FCPBarButton].
  FCPBarButton({
    required this.title,
    required this.onPress,
    this.style = FCPBarButtonStyles.rounded,
  });

  /// The title displayed on the bar button.
  final String title;

  /// The style to use when displaying the button.
  /// Default is [FCPBarButtonStyles.rounded]
  final FCPBarButtonStyles style;

  /// Fired when the user taps the button.
  final void Function() onPress;
}
