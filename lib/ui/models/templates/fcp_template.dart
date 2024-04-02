import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/fcp_interactive_component.dart';

/// A superclass for all templates.
abstract base class FCPTemplate extends FCPInteractiveComponent {
  /// Generated data model for [TemplateHostApi]
  abstract final WrappedTemplateData templateData;

  /// The category of the template.
  abstract final FCPTemplateCategory templateCategory;
}

/// A superclass for templates that are presented fullscreen.
abstract base class FCPFullscreenTemplate extends FCPTemplate {
  @override
  final templateCategory = FCPTemplateCategory.fullscreen;
}

/// A superclass for templates that are presented modally.
abstract base class FCPModalTemplate extends FCPTemplate {
  @override
  final templateCategory = FCPTemplateCategory.modal;
}

/// A mixin for templates that can be used as root.
base mixin FCPRootTemplate on FCPTemplate {}

/// A mixin for templates that can be pushed.
base mixin FCPPushableTemplate on FCPTemplate {}
