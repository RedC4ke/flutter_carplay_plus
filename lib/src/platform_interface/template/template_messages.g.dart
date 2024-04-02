// Autogenerated from Pigeon (v17.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum FCPImageSource {
  network,
}

enum FCPTemplateType {
  list,
  modal,
  tabBar,
}

enum FCPTemplateCategory {
  fullscreen,
  modal,
}

class FCPComponentData {
  FCPComponentData({
    required this.componentId,
  });

  String componentId;

  Object encode() {
    return <Object?>[
      componentId,
    ];
  }

  static FCPComponentData decode(Object result) {
    result as List<Object?>;
    return FCPComponentData(
      componentId: result[0]! as String,
    );
  }
}

class FCPImageData {
  FCPImageData({
    required this.source,
    required this.path,
  });

  FCPImageSource source;

  String path;

  Object encode() {
    return <Object?>[
      source.index,
      path,
    ];
  }

  static FCPImageData decode(Object result) {
    result as List<Object?>;
    return FCPImageData(
      source: FCPImageSource.values[result[0]! as int],
      path: result[1]! as String,
    );
  }
}

class FCPSystemImageData {
  FCPSystemImageData({
    required this.symbolIdentifier,
  });

  String symbolIdentifier;

  Object encode() {
    return <Object?>[
      symbolIdentifier,
    ];
  }

  static FCPSystemImageData decode(Object result) {
    result as List<Object?>;
    return FCPSystemImageData(
      symbolIdentifier: result[0]! as String,
    );
  }
}

class FCPTabData {
  FCPTabData({
    this.tabTitle,
    this.tabImage,
    this.tabSystemImage,
    this.showsTabBadge = false,
  });

  String? tabTitle;

  FCPImageData? tabImage;

  FCPSystemImageData? tabSystemImage;

  bool showsTabBadge;

  Object encode() {
    return <Object?>[
      tabTitle,
      tabImage?.encode(),
      tabSystemImage?.encode(),
      showsTabBadge,
    ];
  }

  static FCPTabData decode(Object result) {
    result as List<Object?>;
    return FCPTabData(
      tabTitle: result[0] as String?,
      tabImage: result[1] != null
          ? FCPImageData.decode(result[1]! as List<Object?>)
          : null,
      tabSystemImage: result[2] != null
          ? FCPSystemImageData.decode(result[2]! as List<Object?>)
          : null,
      showsTabBadge: result[3]! as bool,
    );
  }
}

class WrappedTemplateData {
  WrappedTemplateData({
    required this.type,
    this.listTemplateData,
    this.tabBarTemplateData,
  });

  FCPTemplateType type;

  FCPListTemplateData? listTemplateData;

  FCPTabBarTemplateData? tabBarTemplateData;

  Object encode() {
    return <Object?>[
      type.index,
      listTemplateData?.encode(),
      tabBarTemplateData?.encode(),
    ];
  }

  static WrappedTemplateData decode(Object result) {
    result as List<Object?>;
    return WrappedTemplateData(
      type: FCPTemplateType.values[result[0]! as int],
      listTemplateData: result[1] != null
          ? FCPListTemplateData.decode(result[1]! as List<Object?>)
          : null,
      tabBarTemplateData: result[2] != null
          ? FCPTabBarTemplateData.decode(result[2]! as List<Object?>)
          : null,
    );
  }
}

class FCPTemplateData {
  FCPTemplateData({
    required this.objectData,
    this.tabData,
    required this.category,
  });

  FCPComponentData objectData;

  FCPTabData? tabData;

  FCPTemplateCategory category;

  Object encode() {
    return <Object?>[
      objectData.encode(),
      tabData?.encode(),
      category.index,
    ];
  }

  static FCPTemplateData decode(Object result) {
    result as List<Object?>;
    return FCPTemplateData(
      objectData: FCPComponentData.decode(result[0]! as List<Object?>),
      tabData: result[1] != null
          ? FCPTabData.decode(result[1]! as List<Object?>)
          : null,
      category: FCPTemplateCategory.values[result[2]! as int],
    );
  }
}

class FCPTabBarTemplateData {
  FCPTabBarTemplateData({
    required this.templateData,
    required this.templates,
  });

  FCPTemplateData templateData;

  List<WrappedTemplateData?> templates;

  Object encode() {
    return <Object?>[
      templateData.encode(),
      templates,
    ];
  }

  static FCPTabBarTemplateData decode(Object result) {
    result as List<Object?>;
    return FCPTabBarTemplateData(
      templateData: FCPTemplateData.decode(result[0]! as List<Object?>),
      templates: (result[1] as List<Object?>?)!.cast<WrappedTemplateData?>(),
    );
  }
}

class FCPListTemplateData {
  FCPListTemplateData({
    required this.templateData,
    this.barButtonProvidingData,
  });

  FCPTemplateData templateData;

  FCPBarButtonProvidingData? barButtonProvidingData;

  Object encode() {
    return <Object?>[
      templateData.encode(),
      barButtonProvidingData?.encode(),
    ];
  }

  static FCPListTemplateData decode(Object result) {
    result as List<Object?>;
    return FCPListTemplateData(
      templateData: FCPTemplateData.decode(result[0]! as List<Object?>),
      barButtonProvidingData: result[1] != null
          ? FCPBarButtonProvidingData.decode(result[1]! as List<Object?>)
          : null,
    );
  }
}

class FCPBarButtonProvidingData {
  FCPBarButtonProvidingData({
    this.backButtonData,
    this.leadingNavigationBarButtonsData,
    this.trailingNavigationBarButtonsData,
  });

  FCPBarButtonData? backButtonData;

  List<FCPBarButtonData?>? leadingNavigationBarButtonsData;

  List<FCPBarButtonData?>? trailingNavigationBarButtonsData;

  Object encode() {
    return <Object?>[
      backButtonData?.encode(),
      leadingNavigationBarButtonsData,
      trailingNavigationBarButtonsData,
    ];
  }

  static FCPBarButtonProvidingData decode(Object result) {
    result as List<Object?>;
    return FCPBarButtonProvidingData(
      backButtonData: result[0] != null
          ? FCPBarButtonData.decode(result[0]! as List<Object?>)
          : null,
      leadingNavigationBarButtonsData: (result[1] as List<Object?>?)?.cast<FCPBarButtonData?>(),
      trailingNavigationBarButtonsData: (result[2] as List<Object?>?)?.cast<FCPBarButtonData?>(),
    );
  }
}

class FCPBarButtonData {
  FCPBarButtonData({
    required this.objectData,
    this.image,
    this.title,
  });

  FCPComponentData objectData;

  FCPImageData? image;

  String? title;

  Object encode() {
    return <Object?>[
      objectData.encode(),
      image?.encode(),
      title,
    ];
  }

  static FCPBarButtonData decode(Object result) {
    result as List<Object?>;
    return FCPBarButtonData(
      objectData: FCPComponentData.decode(result[0]! as List<Object?>),
      image: result[1] != null
          ? FCPImageData.decode(result[1]! as List<Object?>)
          : null,
      title: result[2] as String?,
    );
  }
}

class _TemplateHostApiCodec extends StandardMessageCodec {
  const _TemplateHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is FCPBarButtonData) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is FCPBarButtonData) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is FCPBarButtonProvidingData) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is FCPComponentData) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is FCPImageData) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is FCPListTemplateData) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is FCPSystemImageData) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is FCPTabBarTemplateData) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is FCPTabData) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FCPTemplateData) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is WrappedTemplateData) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is WrappedTemplateData) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return FCPBarButtonData.decode(readValue(buffer)!);
      case 129: 
        return FCPBarButtonData.decode(readValue(buffer)!);
      case 130: 
        return FCPBarButtonProvidingData.decode(readValue(buffer)!);
      case 131: 
        return FCPComponentData.decode(readValue(buffer)!);
      case 132: 
        return FCPImageData.decode(readValue(buffer)!);
      case 133: 
        return FCPListTemplateData.decode(readValue(buffer)!);
      case 134: 
        return FCPSystemImageData.decode(readValue(buffer)!);
      case 135: 
        return FCPTabBarTemplateData.decode(readValue(buffer)!);
      case 136: 
        return FCPTabData.decode(readValue(buffer)!);
      case 137: 
        return FCPTemplateData.decode(readValue(buffer)!);
      case 138: 
        return WrappedTemplateData.decode(readValue(buffer)!);
      case 139: 
        return WrappedTemplateData.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class TemplateHostApi {
  /// Constructor for [TemplateHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  TemplateHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _TemplateHostApiCodec();

  Future<void> pushTemplate({required WrappedTemplateData wrappedTemplateData, bool animated = true, bool asRoot = false,}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.flutter_carplay_plus.TemplateHostApi.pushTemplate';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[wrappedTemplateData, animated, asRoot]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> updateTabBarChildTemplates({required String tabBarTemplateId, required List<WrappedTemplateData?> templates}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.flutter_carplay_plus.TemplateHostApi.updateTabBarChildTemplates';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[tabBarTemplateId, templates]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}

abstract class TemplateFlutterApi {
  static const MessageCodec<Object?> pigeonChannelCodec = StandardMessageCodec();

  void onActionCompletion(String objectId);

  void onTabSelected(String tabBarTemplateId, String selectedTemplateId);

  static void setup(TemplateFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onActionCompletion', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onActionCompletion was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_objectId = (args[0] as String?);
          assert(arg_objectId != null,
              'Argument for dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onActionCompletion was null, expected non-null String.');
          try {
            api.onActionCompletion(arg_objectId!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onTabSelected', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onTabSelected was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_tabBarTemplateId = (args[0] as String?);
          assert(arg_tabBarTemplateId != null,
              'Argument for dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onTabSelected was null, expected non-null String.');
          final String? arg_selectedTemplateId = (args[1] as String?);
          assert(arg_selectedTemplateId != null,
              'Argument for dev.flutter.pigeon.flutter_carplay_plus.TemplateFlutterApi.onTabSelected was null, expected non-null String.');
          try {
            api.onTabSelected(arg_tabBarTemplateId!, arg_selectedTemplateId!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
