import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/other/fcp_image.dart';
import 'package:flutter_carplay_plus/ui/models/templates/fcp_tab_bar_template.dart';

/// This object contains information that is used when creating a tab in a
/// [FCPTabBarTemplate].
class FCPTab {
  /// Creates a new instance of [FCPTab].
  FCPTab({
    this.title,
    this.image,
    this.showTabBadge = false,
  });

  /// A short title of the tab.
  final String? title;

  /// An image that will be used as a tab icon.
  final FCPImage? image;

  /// If this value is true, CarPlay displays a red notification
  /// badge on the tab.
  final bool showTabBadge;

  /// Converts this object to a [FCPTabData] data object.
  FCPTabData toTabData() {
    final image = this.image?.toImageData();

    return FCPTabData(
      tabTitle: title,
      tabImage: image,
      showsTabBadge: showTabBadge,
    );
  }
}
