import 'dart:ui';

import 'package:flutter_carplay_plus/ui/models/fcp_interactive_component.dart';

/// A superclass for all clickable components.
abstract class FCPClickableComponent extends FCPComponent {
  /// Creates a new instance of [FCPClickableComponent].
  FCPClickableComponent({this.onPress});

  /// Fired when the component is pressed.
  VoidCallback? onPress;
}
