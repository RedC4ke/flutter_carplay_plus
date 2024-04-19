import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/fcp_component.dart';
import 'package:flutter_carplay_plus/ui/models/other/fcp_clickable_component.dart';
import 'package:flutter_carplay_plus/ui/models/other/fcp_image.dart';

class FCPButton extends FCPClickableComponent {
  /// Creates a new instance of [FCPButton].
  FCPButton({
    required this.title,
    super.onPress,
    this.image,
    this.isEnabled = true,
  });

  /// The title displayed on the button.
  final String title;
  final FCPImage? image;
  final bool isEnabled;

  @override
  FCPButtonData get serializedData {
    return FCPButtonData(
      componentData: componentData,
      title: title,
      image: image?.toImageData(),
      isEnabled: isEnabled,
    );
  }

  @override
  List<FCPComponent> get childComponents => [this];
}
