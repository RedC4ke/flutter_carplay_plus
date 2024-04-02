import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:uuid/v4.dart';

/// A superclass for all templates.
abstract base class FCPTemplate {
  /// Generated data model for [TemplateHostApi]
  abstract final dynamic templateData;

  final UuidV4 _uuid = const UuidV4();
}

/// An interface for templates that can be used as root.
abstract interface class FCPRootTemplate {}

/// A superclass for templates that can be pushed.
abstract base class FCPNavigableTemplate implements FCPTemplate {}

/// A superclass for templates that can be presented modally.
abstract base class FCPModalTemplate implements FCPTemplate {}
