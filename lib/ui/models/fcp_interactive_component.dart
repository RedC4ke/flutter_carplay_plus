import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:uuid/v4.dart';

/// A superclass for all UI components.
abstract class FCPComponent {
  /// A unique identifier for the component.
  final UuidV4 uuid = const UuidV4();

  /// Data model for the component used by [TemplateHostApi].
  FCPComponentData get componentData => FCPComponentData(
        componentId: uuid.toString(),
      );

  /// Converts this object to a related data model.
  Object get serializedData;
}
