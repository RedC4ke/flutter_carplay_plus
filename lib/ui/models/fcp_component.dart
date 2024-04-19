import 'package:flutter/foundation.dart';
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

  /// A getter for the list of all child components.
  @visibleForOverriding
  List<FCPComponent> get childComponents;

  /// A getter for the component itself and all underlying components.
  List<FCPComponent> get componentHierarchy => [this, ...childComponents];
}

/// A superclass for all interactive UI components (buttons etc.).
abstract class FCPInteractiveComponent extends FCPComponent {
  /// Called when the user interacts with the component.
  abstract final void Function(
    FCPInteractiveComponent,
    Function complete,
  )? onPressed;
}

/// A helper extension for [List] of [FCPComponent].
extension XList on List<FCPComponent> {
  /// Finds a component by its unique identifier.
  Future<FCPComponent?> findByUuid(String uuid) async {
    for (final c in this) {
      if (c.uuid.toString() == uuid) {
        return c;
      }

      for (final child in c.componentHierarchy) {
        if (child.uuid.toString() == uuid) {
          return child;
        }
      }
    }

    return null;
  }
}
