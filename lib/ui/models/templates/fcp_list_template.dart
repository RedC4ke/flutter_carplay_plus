import 'package:flutter_carplay_plus/ui/models/templates/fcp_template.dart';
import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_section.dart';

/// A representation of Apple's [CPListTemplate](https://developer.apple.com/documentation/carplay/cplisttemplate).
/// A template for displaying a list of items, grouped into one or more [FCPListSection]s.
///
/// **IMPORTANT:** Some vehicles may limit the number of items that can be displayed.
/// See [FCPSessionConfiguration] for more.
final class FCPListTemplate extends FCPNavigableTemplate
    implements FCPRootTemplate {
  /// Creates a new instance of [FCPListTemplate].
  FCPListTemplate({
    required this.sections,
    required this.systemIcon,
    this.title,
    this.emptyViewTitleVariants,
    this.emptyViewSubtitleVariants,
    this.showsTabBadge = false,
  });

  /// A title displayed in the navigation bar.
  /// It will be displayed when only the list template is visible.
  final String? title;

  /// A list of [FCPListSection] objects that define the structure of the list.
  final List<FCPListSection> sections;

  /// An optional array of title variants for the template’s empty view.
  /// CarPlay will display the first variant that fits the available space.
  final List<String>? emptyViewTitleVariants;

  /// An optional array of subtitle variants for the template’s empty view.
  /// CarPlay will display the first variant that fits the available space.
  final List<String>? emptyViewSubtitleVariants;

  /// If the value is true, CarPlay displays a red notification
  /// badge on the tab.
  final bool showsTabBadge;

  /// An ID of the SF Symbol that will be used as a template icon if
  /// the template is being displayed in the tab bar.
  ///
  /// **See**:
  /// - [SF Symbols Apple Website](https://developer.apple.com/sf-symbols/)
  /// - [SF Symbols - Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/)
  ///
  /// **IMPORTANT:**
  /// All SF Symbols shall be considered to be system-provided images as defined in the Xcode and Apple SDKs
  /// license agreements and are subject to the terms and conditions set forth therein. You may not use SF
  /// Symbols—or glyphs that are substantially or confusingly similar—in your app icons, logos, or any other
  /// trademark-related use. Apple reserves the right to review and, in its sole discretion, require modification
  /// or discontinuance of use of any Symbol used in violation of the foregoing restrictions, and you agree to
  /// promptly comply with any such request.
  final String systemIcon;

  void updateSections(List<FCPListSection> newSections) {
    sections
      ..clear()
      ..addAll(newSections);
    // TODO(Redc4ke): Implement a callback of some sort.
    // FlutterCarPlayController.updateCPListTemplateSections(this);
  }
}
