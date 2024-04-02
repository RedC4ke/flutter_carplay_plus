import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_section.dart';

/// A location of the Now Playing indicator on a list item.
enum FCPListItemPlayingIndicatorLocations {
  /// The Now Playing indicator is displayed on the trailing edge of the list item.
  trailing,

  /// The Now Playing indicator is displayed on the leading edge of the list item.
  leading,
}

/// Defines accessory types that can be displayed on a list item.
enum FCPListItemAccessoryTypes {
  /// No accessory is displayed.
  none,

  /// A cloud icon is displayed.
  cloud,

  /// A horizontal chevron icon is displayed.
  disclosureIndicator,
}

/// A selectable tile in a [FCPListSection].
class FCPListItem {
  /// Creates a new instance of [FCPListItem].
  FCPListItem({
    required this.text,
    this.detailText,
    this.onPress,
    this.image,
    this.playbackProgress,
    this.isPlaying,
    this.playingIndicatorLocation,
    this.accessoryType,
    this.accessoryImage,
  });

  /// List item name.
  String text;

  /// An optional detail text for the list item.
  String? detailText;

  /// An optional callback function that will be called when the list item is pressed.
  final void Function(void Function() complete, FCPListItem self)? onPress;

  /// Displays an image on the leading edge of the list item cell.
  // TODO(Redc4ke): Add more information and a safer way to handle images.
  String? image;

  /// The playback progress (0-1) of the currently playing item.
  /// Hidden when the value is null.
  double? playbackProgress;

  /// Determines whether the list item displays its Now Playing indicator.
  bool? isPlaying;

  /// The location where the list item displays its Now Playing indicator.
  FCPListItemPlayingIndicatorLocations? playingIndicatorLocation;

  /// An accessory that the list item displays in its trailing region.
  FCPListItemAccessoryTypes? accessoryType;

  /// An accessory image that the list item displays in its trailing region.
  // TODO(Redc4ke): Provide an UI Brightness differentiation for images.
  String? accessoryImage;

  /// Updating the list item's primary text.
  void setText(String text) {
    this.text = text;
    //FlutterCarPlayController.updateCPListItem(this);
  }

  /// Updating the list item's secondary text.
  void setDetailText(String detailText) {
    this.detailText = detailText;
    //FlutterCarPlayController.updateCPListItem(this);
  }

  /// Updating the list item's both the primary and detail text at the same time.
  void updateTexts({String? text, String? detailText}) {
    this.text = text ?? this.text;
    this.detailText = detailText ?? this.detailText;
    //FlutterCarPlayController.updateCPListItem(this);
  }

  /// Updating the image which will be displayed on the leading edge of the list item cell.
  /// Image asset path in pubspec.yaml file.
  /// For example: images/flutter_logo.png
  set updateImage(String? image) {
    this.image = image;
    //FlutterCarPlayController.updateCPListItem(this);
  }

  /// Setter for playbackProgress
  /// When the given value is not between 0.0 and 1.0, throws [RangeError]
  // void setPlaybackProgress(double playbackProgress) {
  //   if (playbackProgress >= 0.0 && playbackProgress <= 1.0) {
  //     this.playbackProgress = playbackProgress;
  //     //FlutterCarPlayController.updateCPListItem(this);
  //   } else {
  //     throw RangeError('playbackProgress must be between 0.0 and 1.0');
  //   }
  // }

  // /// Setter for isPlaying
  // void setIsPlaying(bool isPlaying) {
  //   this.isPlaying = isPlaying;
  //   //FlutterCarPlayController.updateCPListItem(this);
  // }

  // /// Setter for playingIndicatorLocation
  // void setPlayingIndicatorLocation(
  //   FCPListItemPlayingIndicatorLocations playingIndicatorLocation,
  // ) {
  //   this.playingIndicatorLocation = playingIndicatorLocation;
  //   FlutterCarPlayController.updateCPListItem(this);
  // }

  // /// Setter for accessoryType
  // void setAccessoryType(CPListItemAccessoryTypes accessoryType) {
  //   this.accessoryType = accessoryType;
  //   FlutterCarPlayController.updateCPListItem(this);
  // }

  // /// Setter for accessoryIcon
  // void setAccessoryIcon(String accessoryIcon) {
  //   this.accessoryIcon = accessoryIcon;
  //   FlutterCarPlayController.updateCPListItem(this);
  // }
}
