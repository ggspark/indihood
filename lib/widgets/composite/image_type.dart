import 'package:flutter/cupertino.dart';
import 'package:indihood/widgets/base_type.dart';

///A widget to render the data with following schema
/// {
///    "type": "SCHEMA",
///    "url": {
///      "type": "string",
///      "num": "1"
///    },
///    "label": {
///      "type": "string",
///      "num": "1"
///    }
/// }
class ImageType extends BaseType {
  ///Constructor to initialise the fields
  const ImageType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Image.network(data["url"]);
  }
}
