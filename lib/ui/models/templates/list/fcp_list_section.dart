import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_item.dart';

/// A section object of list items that appear in a list template.
class FCPListSection {
  /// Creates a new instance of [FCPListSection].
  FCPListSection({
    required this.items,
    this.header,
  });

  /// Header text of the section.
  final String? header;

  /// A list of items to include in the section.
  final List<FCPListItem> items;
}
