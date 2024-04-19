import 'package:flutter_carplay_plus/src/platform_interface/template/template_messages.g.dart';
import 'package:flutter_carplay_plus/ui/models/fcp_component.dart';
import 'package:flutter_carplay_plus/ui/models/templates/list/fcp_list_item.dart';

/// A section object of list items that appear in a list template.
class FCPListSection extends FCPComponent {
  /// Creates a new instance of [FCPListSection].
  FCPListSection({
    required this.items,
    this.header,
  });

  /// Header text of the section.
  final String? header;

  /// A list of items to include in the section.
  final List<FCPListItem> items;

  @override
  FCPListSectionData get serializedData {
    return FCPListSectionData(
      header: header,
      items: items.map((e) => e.serializedData).toList(),
    );
  }

  @override
  List<FCPComponent> get childComponents {
    return items.expand((e) => e.componentHierarchy).toList();
  }
}
