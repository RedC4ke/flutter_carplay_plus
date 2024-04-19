import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/fcp_component.dart';
import 'package:flutter_carplay_plus/ui/models/other/fcp_image.dart';
import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_section.dart';

/// A selectable tile in a [FCPListSection].
class FCPListItem extends FCPInteractiveComponent {
  /// Creates a new instance of [FCPListItem].
  FCPListItem({
    required this.text,
    this.detailText,
    this.image,
    this.accessoryImage,
    this.isEnabled = true,
    this.playbackProgress = 0,
    this.isPlaying = false,
    this.accessoryType = FCPListItemAccessoryType.none,
    this.playingIndicatorLocation =
        FCPListItemPlayingIndicatorLocation.trailing,
    this.isExplicitContent = false,
    this.onPressed,
  });

  /// List item name.
  final String text;

  final bool isEnabled;

  @override
  final void Function(FCPInteractiveComponent self, Function complete)?
      onPressed;

  /// An optional detail text for the list item.
  final String? detailText;

  /// Displays an image on the leading edge of the list item cell.
  final FCPImage? image;

  /// The playback progress (0-1) of the currently playing item.
  /// Hidden when the value is 0.
  final double playbackProgress;

  /// Determines whether the list item displays its Now Playing indicator.
  final bool isPlaying;

  final FCPListItemAccessoryType accessoryType;

  final FCPListItemPlayingIndicatorLocation playingIndicatorLocation;
  final bool isExplicitContent;
  final FCPImage? accessoryImage;

  @override
  WrappedListItemData get serializedData {
    return WrappedListItemData(
      type: FCPListTemplateItemType.listItem,
      itemData: FCPListTemplateItemData(
        componentData: componentData,
        text: text,
        isEnabled: isEnabled,
      ),
      listItemData: FCPListItemData(
        accessoryType: accessoryType,
        detailText: detailText,
        image: image?.toImageData(),
        isExplicitContent: isExplicitContent,
        isPlaying: isPlaying,
        playingIndicatorLocation: playingIndicatorLocation,
        playbackProgress: playbackProgress,
        accessoryImage: accessoryImage?.toImageData(),
      ),
    );
  }

  @override
  List<FCPComponent> get childComponents {
    return [];
  }
}
